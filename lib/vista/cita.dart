//Funcionando
import 'dart:convert';
import 'dart:math';
import 'package:parcial/peticion/citahttp.dart';
import 'package:parcial/vista/listapaciente.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'menuempleado.dart';
import 'Menu.dart';

import 'Menu.dart';
import 'consultaempleado.dart';

void main() => runApp(AdicionarCita());
String usuario;

class AdicionarCita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: AdicionarCitaPage(),
      routes: <String, WidgetBuilder>{
        '/MenuAdministrador': (BuildContext context) => new MenuAdministrador(),
        '/loginpage': (BuildContext context) => AdicionarCitaPage(),
        '/MenuEmpleado': (BuildContext context) => MenuEmpleado(),
      },
    );
  }
}

class AdicionarCitaPage extends StatefulWidget {
  @override
  _AdicionarCitaPageState createState() => _AdicionarCitaPageState();
}

class _AdicionarCitaPageState extends State<AdicionarCitaPage> {
  TextEditingController codigocita = new TextEditingController();
  TextEditingController codigopaciente = new TextEditingController();
  TextEditingController codigotrabajador = new TextEditingController();
  TextEditingController nombrepaciente = new TextEditingController();
  TextEditingController apellidopaciente = new TextEditingController();
  TextEditingController edadpaciente = new TextEditingController();
  TextEditingController fecha = new TextEditingController();
  TextEditingController hora = new TextEditingController();
  TextEditingController nombretrabajador = new TextEditingController();
  TextEditingController apellidotrabajador = new TextEditingController();
  TextEditingController tipotrabajador = new TextEditingController();
  TextEditingController estado = new TextEditingController();

  String mensaje = '';

  Future<List> _paciente() async {
    final response = await http.post(
        Uri.parse(
            'http://localhost/ApiParcial/consultarpacientecodigo.php'),
        body: {
          "codigo": codigopaciente.text,
        });

    var datacita = json.decode(response.body);
    print(datacita);
    if (datacita.length == 0) {
      setState(() {
        mensaje = "¡ ERROR PACIENTE NO ENCONTRADO!";
      });
    } else {
      setState(() {
        codigopaciente = TextEditingController(text: datacita[0]['codigo']);
        nombrepaciente = TextEditingController(text: datacita[0]['nombre']);
        apellidopaciente = TextEditingController(text: datacita[0]['apellido']);
        edadpaciente = TextEditingController(text: datacita[0]['edad']);
      });
    }

    return datacita;
  }

  Future<List> _empleado() async {
    final response = await http.post(
        Uri.parse(
            'http://localhost/ApiParcial/consultarempleadocodigo.php'),
        body: {
          "codigo": codigotrabajador.text,
        });

    var dataempleado = json.decode(response.body);
    print(dataempleado);
    if (dataempleado.length == 0) {
      setState(() {
        mensaje = "¡ ERROR TRABAJADOR NO ENCONTRADO!";
      });
    } else {
      setState(() {
        codigotrabajador =
            TextEditingController(text: dataempleado[0]['codigo']);
        nombretrabajador =
            TextEditingController(text: dataempleado[0]['nombre']);
        apellidotrabajador =
            TextEditingController(text: dataempleado[0]['apellido']);
        tipotrabajador = TextEditingController(text: dataempleado[0]['tipo']);
      });
    }

    return dataempleado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Container(
          padding: EdgeInsets.all(5.0),
          width: 50,
          height: 50,
          child: IconButton(
              tooltip: 'Volver al menu',
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuAdministrador()),
                );
              }),
        ),
        backgroundColor: Colors.greenAccent,



        title: Text(
          'REGISTRO Empleado',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
          color: Colors.lightBlue[300],
          padding: EdgeInsets.all(6.0),
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
                        SizedBox(height: 15),
                        TextField(
                          controller: codigopaciente,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.perm_identity,
                                color: Colors.black,
                              ),
                              labelText: 'Identificación Paciente',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  codigopaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 6),

                        //Boton buscar cliente
                        SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: () {
                            _paciente();
                          },
                          child: Text('BUSCAR PACIENTE'),
                        ),

                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 10.0, color: Colors.black),
                        ),

                        SizedBox(height: 16),
                        TextField(
                          controller: nombrepaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Nombre Del Paciente',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  nombrepaciente.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: apellidopaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Apellido del Paciente',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  apellidopaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: edadpaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.date_range),
                              labelText: 'Edad del Paciente',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  edadpaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: codigotrabajador,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Codigo del trabajador',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  codigotrabajador.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 10),

                        //Boton consultar trabajador

                        ElevatedButton(
                          onPressed: () {
                            _empleado();
                          },
                          child: Text('BUSCAR TRABAJADOR'),
                        ),
                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 10.0, color: Colors.black),
                        ),

                        TextField(
                          controller: nombretrabajador,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Nombre del trabajador',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  nombretrabajador.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: apellidotrabajador,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Apellido del trabajador',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  apellidotrabajador.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: tipotrabajador,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Tipo de trabajador',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  tipotrabajador.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: codigocita,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.date_range),
                              labelText: 'Codigo Cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  codigocita.clear();
                                },
                              )
                            //probar suffix
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: fecha,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.date_range),
                              labelText: 'Fecha Cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  fecha.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: hora,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.watch),
                              labelText: 'Hora Cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  hora.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: estado,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.check_box),
                              labelText: 'Estado de la Cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  estado.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 16),

                        SizedBox(height: 5),
                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        Container(
                          height: 50,
                          child: new RaisedButton(
                            onPressed: () {
                              adicionarCita(
                                  codigocita.text.trim(),
                                  fecha.text.trim(),
                                  hora.text.trim(),
                                  estado.text.trim(),
                                  codigopaciente.text.trim(),
                                  nombrepaciente.text.trim(),
                                  apellidopaciente.text.trim(),
                                  edadpaciente.text.trim(),
                                  codigotrabajador.text.trim(),
                                  nombretrabajador.text.trim(),
                                  apellidotrabajador.text.trim(),
                                  tipotrabajador.text.trim());
                              Navigator.pop(context, true);
                            },
                            color: Colors.purple[300],
                            child: new Text(
                              'Guardar Cita',
                              style: new TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              )
            ],
          )),
    );
  }
}
