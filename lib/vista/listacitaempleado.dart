import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial/modelo/cita.dart';
import 'package:parcial/vista/Menu.dart';
import 'package:parcial/vista/cita.dart';
import 'package:parcial/vista/detallecita.dart';
import 'package:parcial/vista/menuempleado.dart';

Future<List<Cita>> listarPost(http.Client client) async {
  final response = await http
      .get(Uri.parse('http://localhost/ApiParcial/consultarcita.php'));

  return compute(pasaraListas, response.body);
}

List<Cita> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Cita>((json) => Cita.fromJson(json)).toList();
}

void main() {
  runApp(ListaCitaEmpleado());
}

class ListaCitaEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cita',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(
        title: 'Cita',
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
                  MaterialPageRoute(builder: (context) => MenuEmpleado()),
                );
              }),
        ),
        title: Text('Cita'),
        /*actions: [
          /*IconButton(
              tooltip: 'Registrar Paciente',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdicionarCita()),
                );
              }),*/
        ],*/
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
              ? Vistacita(posts: snapshot.data)
              : Text('No hay datos en el sistema');

        default:
          return Text('Presione el boton para actualizar');
      }
    },
  );
}

class Vistacita extends StatelessWidget {
  final List<Cita> posts;

  const Vistacita({Key key, this.posts}) : super(key: key);

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
                      builder: (BuildContext context) =>
                          DetalleCita(perfil: posts, codigoperfil: posicion)));
            },
            title: Text("Nombre: "+posts[posicion].nombrepaciente + posts[posicion].apellidopaciente),
            subtitle: Text("Hora: " + posts[posicion].hora + " - Fecha: "+posts[posicion].fecha),

            trailing: Container(

              width: 100,
              height: 100,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(

                      width: 100,
                      height: 100,
                      child: Text(posts[posicion].estado),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      color: posts[posicion].estado ==
                          'No atendida'
                          ? Colors.orange
                          : Colors.green,
                    ),
                  ),

                ],
              ),
              //child: Text(posts[posicion].estado),

            ),
          );
        });
  }
}
