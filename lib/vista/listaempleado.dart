//Funcionando
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial/modelo/empleado.dart';
import 'package:parcial/vista/Menu.dart';

import 'package:parcial/vista/perfilempleado.dart';

import 'adicionarempleado.dart';

Future<List<Empleado>> listarPost(http.Client client) async {
  final response = await http
      .get(Uri.parse('http://localhost/ApiParcial/consultarempleado.php'));

  return compute(pasaraListas, response.body);
}

List<Empleado> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Empleado>((json) => Empleado.fromJson(json)).toList();
}

void main() {
  runApp(ListaEmpleado());
}

class ListaEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Empleado',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(
        title: 'Empleado',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Empleado'),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuAdministrador())
              );
            },
          ),
        ),
        actions: [
          IconButton(
              tooltip: 'Registrar Empleado',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdicionarEmpleado()),
                );
              }),
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Actualizar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPost(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? Vistaempleado(posts: snapshot.data)
              : Text('No hay datos en el sistema');

        default:
          return Text('Presione el boton para actualizar');
      }
    },
  );
}

class Vistaempleado extends StatelessWidget {
  final List<Empleado> posts;

  const Vistaempleado({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilEmpleado(
                          perfil2: posts, codigoperfil2: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(posts[posicion].foto),
            ),
            title: Text(posts[posicion].nombre),
            subtitle: Text(posts[posicion].apellido),
            trailing: Container(
              width: 80,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(posts[posicion].estado),
              color: posts[posicion].estado == 'Activo'
                  ? Colors.green
                  : Colors.orange,
            ),
          );
        });
  }
}
