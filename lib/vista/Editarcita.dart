import 'package:parcial/modelo/cita.dart';
import 'package:parcial/modelo/paciente.dart';
import 'package:parcial/peticion/citahttp.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:flutter/material.dart';

class Editarcita extends StatefulWidget {
  final citaperfil;
  final List<Cita> posts;
  Editarcita({Key key, this.posts, this.citaperfil});

  @override
  _EditarcitaState createState() => _EditarcitaState();
}

class _EditarcitaState extends State<Editarcita> {
  TextEditingController Controlcodigo = TextEditingController();
  TextEditingController Controlfecha = TextEditingController();
  TextEditingController Controlhora = TextEditingController();
  TextEditingController Controlestado = TextEditingController();
  TextEditingController Controlobservacion = TextEditingController();

  @override
  void initState() {
    Controlfecha =
        TextEditingController(text: widget.posts[widget.citaperfil].fecha);
    Controlhora =
        TextEditingController(text: widget.posts[widget.citaperfil].hora);
    Controlestado =
        TextEditingController(text: widget.posts[widget.citaperfil].estado);
    Controlobservacion = TextEditingController(
        text: widget.posts[widget.citaperfil].observacion);
    Controlcodigo =
      TextEditingController(text: widget.posts[widget.citaperfil].codigocita.toString());


    /*widget.posts[widget.citaperfil].estado == 'Activo'
        ? Estado = true
        : Estado = false;*/

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar cita"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: Controlcodigo,
                decoration: InputDecoration(labelText: "Código"),
              ),
              TextField(
                controller: Controlfecha,
                decoration: InputDecoration(labelText: "Fecha"),
              ),
              TextField(
                controller: Controlhora,
                decoration: InputDecoration(labelText: "Hora"),
              ),
              TextField(
                controller: Controlestado,
                decoration: InputDecoration(labelText: "Estado"),
              ),
              TextField(
                controller: Controlobservacion,
                decoration: InputDecoration(labelText: "Observación"),
              ),

              ElevatedButton(
                child: Text("Modificar cita"),
                onPressed: () {
                  editarcita(
                      //widget.posts[widget.citaperfil].codigocita,
                      Controlcodigo.text,
                      Controlfecha.text,
                      Controlhora.text,
                      Controlobservacion.text,
                      Controlestado.text
                  );

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
