//Funcionando
import 'package:flutter/material.dart';
import 'package:parcial/peticion/empleadohttp.dart';
import 'package:parcial/peticion/pacientehttp.dart';
import 'package:parcial/vista/Menu.dart';
import 'menuempleado.dart';

class AdicionarEmpleado extends StatefulWidget {
  AdicionarEmpleado({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AdicionarEmpleadotate createState() => _AdicionarEmpleadotate();
}

class _AdicionarEmpleadotate extends State<AdicionarEmpleado> {
  final TextEditingController CodigoController = new TextEditingController();
  final TextEditingController FotoController = new TextEditingController();
  final TextEditingController NombresController = new TextEditingController();
  final TextEditingController ApellidosController = new TextEditingController();
  final TextEditingController TipoController = new TextEditingController();
  bool estado = false;
  bool trabajo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REGISTRO EMPLEADO',
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
            'REGISTRO Empleado',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          decoration: new BoxDecoration(
            color: Colors.grey[400],
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: CodigoController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Cedula',
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
                    hintText: '',
                    icon: new Icon(Icons.camera),
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
                    //hintText: 'laudaris',
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
                  controller: TipoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tipo De trabajo',
                    //hintText: 'Medico',
                    icon: new Icon(Icons.wysiwyg),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
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
              SwitchListTile(
                title: Text('¿Esta trabajando?'),
                value: trabajo,
                onChanged: (bool value) {
                  setState(() {
                    trabajo = value;
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
                    String trabajotxt = "servicio";
                    estado == true
                        ? trabajotxt = "servicio"
                        : trabajotxt = "libre";

                    adicionarEmpleado(
                        CodigoController.text.trim(),
                        FotoController.text.trim(),
                        NombresController.text.trim(),
                        ApellidosController.text.trim(),
                        TipoController.text.trim(),
                        estadotxt,
                        trabajotxt);
                    Navigator.pop(context, true);
                  },
                  padding: EdgeInsets.zero,
                  color: Colors.cyanAccent,
                  child: new Text(
                    'Guardar Empleado',
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
