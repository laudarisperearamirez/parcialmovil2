//Funcionando
import 'package:parcial/modelo/paciente.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:flutter/material.dart';

class Editarpaciente extends StatefulWidget {
  final pacienteperfil;
  final List<Paciente> posts;
  Editarpaciente({Key key, this.posts, this.pacienteperfil});

  @override
  _EditarpacienteState createState() => _EditarpacienteState();
}

class _EditarpacienteState extends State<Editarpaciente> {
  TextEditingController Controlcodigo = TextEditingController();
  TextEditingController Controlfoto = TextEditingController();
  TextEditingController Controlnombre = TextEditingController();
  TextEditingController Controlapellido = TextEditingController();
  TextEditingController Controlfechanacimiento = TextEditingController();
  TextEditingController Controledad = TextEditingController();
  TextEditingController Controldireccion = TextEditingController();
  TextEditingController Controlbarrio = TextEditingController();
  TextEditingController Controltelefono = TextEditingController();
  TextEditingController Controlciudad = TextEditingController();

  bool Estado = false;
  String EstadoTxt;

  @override
  void initState() {
    Controlcodigo =
        TextEditingController(text: widget.posts[widget.pacienteperfil].codigo);
    Controlfoto =
        TextEditingController(text: widget.posts[widget.pacienteperfil].foto);
    Controlnombre =
        TextEditingController(text: widget.posts[widget.pacienteperfil].nombre);
    Controlapellido = TextEditingController(
        text: widget.posts[widget.pacienteperfil].apellido);
    Controlfechanacimiento = TextEditingController(
        text: widget.posts[widget.pacienteperfil].fechanacimiento);

    Controledad =
        TextEditingController(text: widget.posts[widget.pacienteperfil].edad);

    Controldireccion = TextEditingController(
        text: widget.posts[widget.pacienteperfil].direccion);

    Controlbarrio =
        TextEditingController(text: widget.posts[widget.pacienteperfil].barrio);
    Controltelefono = TextEditingController(
        text: widget.posts[widget.pacienteperfil].telefono);
    Controlciudad =
        TextEditingController(text: widget.posts[widget.pacienteperfil].ciudad);
    EstadoTxt = widget.posts[widget.pacienteperfil].estado;

    widget.posts[widget.pacienteperfil].estado == 'Activo'
        ? Estado = true
        : Estado = false;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar paciente"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: Controlcodigo,
                decoration: InputDecoration(labelText: "Codigo"),
              ),
              TextField(
                controller: Controlfoto,
                decoration: InputDecoration(labelText: "Foto"),
              ),
              TextField(
                controller: Controlnombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: Controlapellido,
                decoration: InputDecoration(labelText: "Apellido"),
              ),
              TextField(
                controller: Controlfechanacimiento,
                decoration: InputDecoration(labelText: "Fecha de nacimiento"),
              ),
              TextField(
                controller: Controledad,
                decoration: InputDecoration(labelText: "Edad"),
              ),
              TextField(
                controller: Controldireccion,
                decoration: InputDecoration(labelText: "Direccion"),
              ),
              TextField(
                controller: Controlbarrio,
                decoration: InputDecoration(labelText: "Barrio"),
              ),
              TextField(
                controller: Controltelefono,
                decoration: InputDecoration(labelText: "Telefono"),
              ),
              TextField(
                controller: Controlciudad,
                decoration: InputDecoration(labelText: "Ciudad"),
              ),
              SwitchListTile(
                title: Text('Estado'),
                value: Estado,
                onChanged: (bool value) {
                  setState(() {
                    Estado = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Modificar Paciente"),
                onPressed: () {
                  Estado == true
                      ? EstadoTxt = "Activo"
                      : EstadoTxt = "Inactivo";
                  editarpaciente(
                      widget.posts[widget.pacienteperfil].codigo,
                      Controlfoto.text,
                      Controlnombre.text,
                      Controlapellido.text,
                      Controlfechanacimiento.text,
                      Controledad.text,
                      Controldireccion.text,
                      Controlbarrio.text,
                      Controltelefono.text,
                      Controlciudad.text,
                      EstadoTxt);

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
