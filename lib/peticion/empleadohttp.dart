import 'dart:convert';

import 'package:parcial/modelo/empleado.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Empleado> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Empleado>((json) => Empleado.fromJson(json)).toList();
}

void adicionarEmpleado(String codigo, String foto, String nombre,
    String apellido, String tipo, String estado, String trabajo) async {
  var url = Uri.parse("http://localhost/ApiParcial/adicionarempleado.php");

  await http.post(url, body: {
    'codigo': codigo,
    'foto': foto,
    'nombre': nombre,
    'apellido': apellido,
    'tipo': tipo,
    'estado': estado,
    'trabajo': trabajo,
  });
}

void editarempleado(String codigo, String foto, String nombre, String apellido,
    String tipo, String estado, String trabajo) async {
  var url = Uri.parse("http://localhost/ApiParcial/editarempleado.php");

  await http.post(url, body: {
    'codigo': codigo,
    'foto': foto,
    'nombre': nombre,
    'apellido': apellido,
    'tipo': tipo,
    'estado': estado,
    'trabajo': trabajo,
  });
}

void empleadoEliminar(codigo) async {
  var url = Uri.parse("http://localhost/ApiParcial/eliminarempleado.php");

  await http.post(url, body: {
    'codigoeliminar': codigo,
  });
}
