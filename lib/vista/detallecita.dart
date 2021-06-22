//Funcionando
import 'package:parcial/modelo/cita.dart';
import 'package:parcial/modelo/paciente.dart';
import 'package:parcial/vista/editarpaciente.dart';
import 'package:parcial/vista/listapaciente.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:flutter/material.dart';
//import 'package:parcial/vista/personalatencionedit.dart';
import 'package:http/http.dart' as http;

import 'Editarcita.dart';

var contextoppal;

class DetalleCita extends StatelessWidget {
  final codigoperfil;
  final List<Cita> perfil;
  DetalleCita({Key key, this.perfil, this.codigoperfil});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detalle',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cita'),
          actions: [
            IconButton(
                tooltip: 'Editar',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Editarcita(
                              posts: perfil, citaperfil: codigoperfil)));
                }),
          ],
        ),
        body: ListView(children: [
          Container(
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Codigo',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        perfil[codigoperfil].codigocita.toString(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Codigo paciente'),
                                      Text(
                                        perfil[codigoperfil].codigopaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres'),
                                      Text(
                                        perfil[codigoperfil].nombrepaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos Paciente'),
                                      Text(perfil[codigoperfil].apellidopaciente),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Fecha de la cita'),
                                      Text(
                                        perfil[codigoperfil].fecha,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Hora'),
                                      Text(
                                        perfil[codigoperfil].hora,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Codigo Trabajador'),
                                      Text(perfil[codigoperfil].codigotrabajador),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombre Trabajador'),
                                      Text(perfil[codigoperfil].nombretrabajador),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellido Trabajador'),
                                      Text(perfil[codigoperfil].apellidotrabajador),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Estado de la cita'),
                                      SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        height: 50,
                                        child: Text(perfil[codigoperfil].estado),
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        color: perfil[codigoperfil].estado ==
                                                'No atendida'
                                            ? Colors.orange
                                            : Colors.green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
