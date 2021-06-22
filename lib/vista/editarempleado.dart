//Funcionando
import 'package:parcial/modelo/empleado.dart';
import 'package:parcial/peticion/empleadohttp.dart';
import 'package:flutter/material.dart';

class Editarempleado extends StatefulWidget {
  final empleadoperfil;
  final List<Empleado> posts1;
  Editarempleado({Key key, this.posts1, this.empleadoperfil});

  @override
  _EditarempleadoState createState() => _EditarempleadoState();
}

class _EditarempleadoState extends State<Editarempleado> {
  TextEditingController Controlcodigo = TextEditingController();
  TextEditingController Controlfoto = TextEditingController();
  TextEditingController Controlnombre = TextEditingController();
  TextEditingController Controlapellido = TextEditingController();
  TextEditingController Controltipo = TextEditingController();

  bool Estado = false;
  bool Trabajo = false;
  String EstadoTxt;
  String TrabajoTxt;

  @override
  void initState() {
    Controlcodigo = TextEditingController(
        text: widget.posts1[widget.empleadoperfil].codigo);
    Controlfoto =
        TextEditingController(text: widget.posts1[widget.empleadoperfil].foto);
    Controlnombre = TextEditingController(
        text: widget.posts1[widget.empleadoperfil].nombre);
    Controlapellido = TextEditingController(
        text: widget.posts1[widget.empleadoperfil].apellido);
    Controltipo =
        TextEditingController(text: widget.posts1[widget.empleadoperfil].tipo);

    EstadoTxt = widget.posts1[widget.empleadoperfil].estado;

    TrabajoTxt = widget.posts1[widget.empleadoperfil].trabajo;

    widget.posts1[widget.empleadoperfil].estado == 'Activo'
        ? Estado = true
        : Estado = false;
    widget.posts1[widget.empleadoperfil].trabajo == 'servicio'
        ? Trabajo = true
        : Trabajo = false;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Modificar empleado",
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.white60,
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: Controlcodigo,
                  decoration: InputDecoration(
                    labelText: "Cedula",
                    icon: Icon(Icons.perm_identity),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: Controlfoto,
                  decoration: InputDecoration(
                    labelText: "Foto",
                    icon: Icon(Icons.camera),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: Controlnombre,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: Controlapellido,
                  decoration: InputDecoration(
                      labelText: "Apellido", icon: Icon(Icons.person)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: Controltipo,
                  decoration: InputDecoration(
                    labelText: "Tipo De trabajo",
                    icon: Icon(Icons.wysiwyg),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SwitchListTile(
                title: Text('Estado'),
                value: Estado,
                onChanged: (bool value) {
                  setState(() {
                    Estado = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Trabajo'),
                value: Trabajo,
                onChanged: (bool value) {
                  setState(() {
                    Trabajo = value;
                  });
                },
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(right: 150, left: 150),
                child: new RaisedButton(
                  onPressed: () {
                    Estado == true
                        ? EstadoTxt = "Activo"
                        : EstadoTxt = "Inactivo";
                    Trabajo == true
                        ? TrabajoTxt = "servicio"
                        : TrabajoTxt = "Libre";
                    editarempleado(
                        widget.posts1[widget.empleadoperfil].codigo,
                        Controlfoto.text,
                        Controlnombre.text,
                        Controlapellido.text,
                        Controltipo.text,
                        EstadoTxt,
                        TrabajoTxt);

                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  color: Colors.cyanAccent,
                  child: Text(
                    "Modificar Empleado",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
