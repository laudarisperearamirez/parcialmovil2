import 'package:flutter/material.dart';
import 'package:parcial/vista/adicionarpaciente.dart';
import 'package:parcial/vista/cita.dart';
import 'package:parcial/vista/listacita.dart';
import 'package:parcial/vista/listapaciente.dart';
import 'package:parcial/vista/login.dart';
import 'adicionarempleado.dart';
import 'listaempleado.dart';
import 'listapaciente.dart';

/*void main() => runApp(MenuAdministrador());*/

class MenuAdministrador extends StatelessWidget {
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
            accountName: Text('Administrador'),
            decoration: BoxDecoration(
                //Podemos agregar una imagen aunque si es bueno no tan importante como los textos anteriores.
                image: DecorationImage(image: NetworkImage('https://image.freepik.com/foto-gratis/doctor-estetoscopio-manos-fondo-hospital_1423-1.jpg'),
              fit: BoxFit.cover,
                ),

                ),
          ),
          //Menu 1
         Container(
         height: 5,
         ) ,

          //Registrar empleados

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              title: Text('Registrar empleado'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdicionarEmpleado()),
                );
              },
            ),
          ),

          Container(
            height: 10,
          ) ,
          //Consultar el istado de empleados

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              title: Text('Consultar empleado'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListaEmpleado()),
                );
              },
            ),
          ),
          //Mernu 2
          Container(
            height: 10,
          ) ,

          //Registrar paciente

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              title: Text('Registrar Paciente'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdicionarPaciente()),
                );
              },
            ),
          ),

          Container(
            height: 10,
          ) ,
          //Listado de los pacientes

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListaPaciente()),
                );
              },
              title: Text('Consultar Paciente'),
            ),
          ),
          Container(
            height: 10,
          ),
          //Pagina 3

          //Registrar citas

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdicionarCita()),
                );
              },
              title: Text('Registrar Cita'),
            ),
          ),

          Container(
            height: 10,
          ) ,


          //Consultar cita

          Ink(
            color: Colors.blueGrey,
            child: new ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                MaterialPageRoute(
                builder: (BuildContext context) => ListaCita()),
                );
                },
                title: Text('Consultar Cita'),
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
