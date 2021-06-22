//Funcionando
import 'package:parcial/modelo/paciente.dart';
import 'package:parcial/vista/editarpaciente.dart';
import 'package:parcial/vista/listapaciente.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:flutter/material.dart';
//import 'package:parcial/vista/personalatencionedit.dart';
import 'package:http/http.dart' as http;

var contextoppal;

class PerfilPaciente extends StatelessWidget {
  final codigoperfil;
  final List<Paciente> perfil;
  PerfilPaciente({Key key, this.perfil, this.codigoperfil});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paciente'),
          actions: [
            IconButton(
                tooltip: 'Editar',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Editarpaciente(
                              posts: perfil, pacienteperfil: codigoperfil)));
                }),
            IconButton(
                tooltip: 'Eliminar',
                icon: Icon(Icons.delete),
                onPressed: () {
                  eliminarconfirmar(context, perfil[codigoperfil].codigo);
                })
          ],
        ),
        body: ListView(children: [
          Container(
            color: Colors.lightBlue[300],
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 460,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,

                      child: Card(
                        elevation: 2,
                        child: Image.network(perfil[codigoperfil].foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Codigo',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        perfil[codigoperfil].codigo,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Nombres',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        perfil[codigoperfil].nombre,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Apellidos',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      SizedBox(height: 10),
                                      Text(perfil[codigoperfil].apellido),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Estado del paciente'),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 50,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                color: perfil[codigoperfil].estado == 'Servicio'
                                    ? Colors.green
                                    : Colors.orange,
                                child: Text(
                                  perfil[codigoperfil].estado,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar')),
        ]),
      ),
    );
  }
}

void eliminarconfirmar(context, codigoeliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('¿Esta seguro de eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              pacienteEliminar(codigoeliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
