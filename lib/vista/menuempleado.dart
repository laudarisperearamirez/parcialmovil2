//Funcionando
import 'package:flutter/material.dart';
import 'package:parcial/vista/listacitaempleado.dart';
import 'package:parcial/vista/listapaciente.dart';
import 'package:parcial/vista/listapacienteempleado.dart';
import 'adicionarempleado.dart';
import 'consultaempleado.dart';
import 'listaempleado.dart';
import 'listapaciente.dart';
import 'adicionarpaciente.dart';
import 'package:parcial/vista/login.dart';

/*void main() => runApp(MenuAdministrador());*/

class MenuEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter menu',
      routes: <String, WidgetBuilder>{
        "/Paciente": (BuildContext context) => AdicionarEmpleado(),
        // "/API": (BuildContext context) => PeticionHttp(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu lateral'),
        ),
        drawer: MenuLateral(),
        body: Center(),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Empleado'),
            decoration: BoxDecoration(
              //Podemos agregar una imagen aunque si es bueno no tan importante como los textos anteriores.
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.freepik.com/foto-gratis/doctor-estetoscopio-manos-fondo-hospital_1423-1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Menu 1

          Container(
            height: 50,
          ),
          Ink(
            color: Colors.lightBlueAccent,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListaPacienteEmpleado()),
                );
              },
              title: Text('Consultar Paciente'),
            ),
          ),
          Container(
            height: 10,
          ) ,
          Ink(
            color: Colors.red,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListaCitaEmpleado()),
                );
              },
              title: Text('Lista Citas'),
            ),
          ),
          Container(
            height: 10,
          ) ,
          Ink(
            color: Colors.red,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginApp()),
                );
              },
              title: Text('Cerrar sesión'),
            ),
          ),

        ],
      ),
    );
  }
}
