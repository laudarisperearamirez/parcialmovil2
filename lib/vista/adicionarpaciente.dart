//Funcionando
import 'package:flutter/material.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:parcial/vista/Menu.dart';
import 'package:parcial/vista/menuempleado.dart';

class AdicionarPaciente extends StatefulWidget {
  AdicionarPaciente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AdicionarPacienteState createState() => _AdicionarPacienteState();
}

class _AdicionarPacienteState extends State<AdicionarPaciente> {
  final TextEditingController CodigoController = new TextEditingController();
  final TextEditingController FotoController = new TextEditingController();
  final TextEditingController NombresController = new TextEditingController();
  final TextEditingController ApellidosController = new TextEditingController();
  final TextEditingController FechaNacimientoController =
      new TextEditingController();
  final TextEditingController EdadController = new TextEditingController();
  final TextEditingController DireccionController = new TextEditingController();
  final TextEditingController BarrioController = new TextEditingController();
  final TextEditingController TelefonoController = new TextEditingController();
  final TextEditingController CiudadController = new TextEditingController();
  bool estado = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de pacientes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuAdministrador()),
                );
              },
            ),
          ),
          title: Text(
            'REGISTRO PACIENTE',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: CodigoController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'codigo',
                    //hintText: '1193526288',
                    icon: new Icon(Icons.perm_identity),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: FotoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Foto',
                    icon: Icon(Icons.camera),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: NombresController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nombres',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: ApellidosController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Apellidos',
                    //hintText: 'Perea',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: FechaNacimientoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    //hintText: '01121999',
                    icon: new Icon(Icons.date_range),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: EdadController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Edad',
                    //hintText: '21',
                    icon: new Icon(Icons.date_range),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: DireccionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Dirección',
                    //hintText: 'Calle 15-A #24-32',
                    icon: new Icon(Icons.add_location),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: BarrioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Barrio',
                    //hintText: 'Mareigua',
                    icon: new Icon(Icons.add_location),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: TelefonoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Telefono',
                    //hintText: '3076539087',
                    icon: new Icon(Icons.call),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: CiudadController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Ciudad',
                    //hintText: 'Valledupar',
                    icon: new Icon(Icons.add_location),
                  ),
                ),
              ),
              SwitchListTile(
                title: Text('¿Esta activo?'),
                value: estado,
                onChanged: (bool value) {
                  setState(() {
                    estado = value;
                  });
                },
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(right: 50, left: 50),
                child: new RaisedButton(
                  onPressed: () {
                    String estadotxt = "activo";
                    estado == true
                        ? estadotxt = "activo"
                        : estadotxt = "inativo";
                    adicionarPaciente(
                        CodigoController.text.trim(),
                        FotoController.text.trim(),
                        NombresController.text.trim(),
                        ApellidosController.text.trim(),
                        FechaNacimientoController.text.trim(),
                        EdadController.text.trim(),
                        DireccionController.text.trim(),
                        BarrioController.text.trim(),
                        TelefonoController.text.trim(),
                        CiudadController.text.trim(),
                        estadotxt);
                    Navigator.pop(context, true);
                  },
                  padding: EdgeInsets.zero,
                  color: Colors.cyanAccent,
                  child: new Text(
                    'Guardar Paciente',
                    style: new TextStyle(color: Colors.black),
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
