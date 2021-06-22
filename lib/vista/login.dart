//Funcionando
import 'dart:convert';
import 'dart:math';
import 'package:parcial/vista/listapaciente.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'menuempleado.dart';

import 'Menu.dart';
import 'consultaempleado.dart';

void main() => runApp(LoginApp());
String usuario;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/MenuAdministrador': (BuildContext context) => new MenuAdministrador(),
        '/loginpage': (BuildContext context) => LoginPage(),
        '/MenuEmpleado': (BuildContext context) => MenuEmpleado(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuario = new TextEditingController();
  TextEditingController contrasena = new TextEditingController();

  String mensaje = '';

  Future<List> _login() async {
    final response = await http
        .post(Uri.parse('http://localhost/ApiParcial/loguin.php'), body: {
      "usuario": usuario.text,
      "contrasena": contrasena.text,
    });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length == 0) {
      setState(() {
        mensaje = "¡ ERROR USUARIO O CONTRASEÑA INCORRECTA!";
      });
    } else {
      if (datauser[0]['tipousuario'] == 'Administrador') {
        Navigator.pushReplacementNamed(context, '/MenuAdministrador');
      }
      if (datauser[0]['tipousuario'] == 'Empleado') {
        Navigator.pushReplacementNamed(context, '/MenuEmpleado');
      }

      setState(() {
        usuario = datauser[0]['usuario'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.freepik.com/foto-gratis/doctor-estetoscopio-manos-fondo-hospital_1423-1.jpg'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 110),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: _buildCircleAvatar(),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "INICIO DE SESION EN",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "CLINICA SANTA ROSA",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: usuario,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'USUARIO',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  usuario.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: contrasena,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.lock),
                              labelText: 'CONTRASEÑA',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  contrasena.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (usuario.text.isNotEmpty &&
                                contrasena.text.isNotEmpty) {
                              _login();
                            } else {
                              cajaerror(context, 'ERROR CAMPOS VACIOS');
                            }
                          },
                          child: Text('INICIAR SESION'),
                        ),
                        SizedBox(height: 5),
                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        )
                      ],
                    ),
                  )),
                ),
              )
            ],
          )),
    );
  }

  Future<dynamic> cajaerror(BuildContext context, String user) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('ERROR AL INICIAR SESION'),
              content: Text('$user'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginApp()),
                      );
                    },
                    child: Text(
                      'ACEPTAR',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ));
  }

  Widget _buildCircleAvatar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 7, constraints.maxWidth / 7);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              "https://www.flaticon.es/svg/vstatic/svg/1177/1177568.svg?token=exp=1620531753~hmac=71290b82491c0284abe69a99fefe6fbf",
            ),
          ),
        );
      },
    );
  }
}
