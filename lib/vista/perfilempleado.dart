//Funcionando
import 'package:parcial/modelo/empleado.dart';
import 'package:parcial/vista/editarempleado.dart';
import 'package:parcial/peticion/empleadohttp.dart';
import 'package:flutter/material.dart';
//import 'package:parcial/vista/personalatencionedit.dart';
import 'package:http/http.dart' as http;

var contextoppal;

class PerfilEmpleado extends StatelessWidget {
  final codigoperfil2;
  final List<Empleado> perfil2;
  PerfilEmpleado({Key key, this.perfil2, this.codigoperfil2});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Empleado'),
          actions: [
            IconButton(
                tooltip: 'Editar',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Editarempleado(
                              posts1: perfil2, empleadoperfil: codigoperfil2)));
                }),
            IconButton(
                tooltip: 'Eliminar',
                icon: Icon(Icons.delete),
                onPressed: () {
                  eliminarconfirmar(context, perfil2[codigoperfil2].codigo);
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
              //elevation: 5,
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
                        child: Image.network(perfil2[codigoperfil2].foto),
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
                                        'Código',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        perfil2[codigoperfil2].codigo,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Nombres',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        perfil2[codigoperfil2].nombre,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Apellidos',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(perfil2[codigoperfil2].nombre),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'TRABAJO',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'TIPO',
                                        style: TextStyle(
                                          fontFamily: 'RobotoMono',
                                          fontSize: 10,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        color: perfil2[codigoperfil2].trabajo ==
                                                'ENFERMERA'
                                            ? Colors.green
                                            : Colors.orange,
                                        child: Text(
                                          perfil2[codigoperfil2].tipo,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'ESTADO',
                                        style: TextStyle(
                                          fontFamily: 'RobotoMono',
                                          color: Colors.black87,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        color: perfil2[codigoperfil2].estado ==
                                                'Activo'
                                            ? Colors.green
                                            : Colors.orange,
                                        child: Text(
                                          perfil2[codigoperfil2].estado,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '¿TRABAJANDO?',
                                        style: TextStyle(
                                          fontFamily: 'RobotoMono',
                                          color: Colors.black87,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        color: perfil2[codigoperfil2].trabajo ==
                                                'servicio'
                                            ? Colors.green
                                            : Colors.orange,
                                        child: Text(
                                          perfil2[codigoperfil2].trabajo,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Container(height: 40),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 50, left: 50),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Regresar')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              //Agregar el boton dentro del card
            ),
          ),
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
              empleadoEliminar(codigoeliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
