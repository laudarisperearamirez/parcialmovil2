import 'dart:convert';

import 'package:parcial/modelo/paciente.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Paciente> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Paciente>((json) => Paciente.fromJson(json)).toList();
}

void adicionarPaciente(
    String codigo,
    String foto,
    String nombre,
    String apellido,
    String fechanacimiento,
    String edad,
    String direccion,
    String barrio,
    String telefono,
    String ciudad,
    String estado) async {
  var url = Uri.parse("http://localhost/ApiParcial/adicionarpaciente.php");

  await http.post(url, body: {
    'codigo': codigo,
    'foto': foto,
    'nombre': nombre,
    'apellido': apellido,
    'fechanacimiento': fechanacimiento,
    'edad': edad,
    'direccion': direccion,
    'barrio': barrio,
    'telefono': telefono,
    'ciudad': ciudad,
    'estado': estado,
  });
}

void editarpaciente(
    String codigo,
    String foto,
    String nombre,
    String apellido,
    String fechanacimiento,
    String edad,
    String direccion,
    String barrio,
    String telefono,
    String ciudad,
    String estado) async {
  var url = Uri.parse("http://localhost/ApiParcial/editarpaciente.php");

  await http.post(url, body: {
    'codigo': codigo,
    'foto': foto,
    'nombre': nombre,
    'apellido': apellido,
    'fechanacimiento': fechanacimiento,
    'edad': edad,
    'direccion': direccion,
    'barrio': barrio,
    'telefono': telefono,
    'ciudad': ciudad,
    'estado': estado,
  });
}

void pacienteEliminar(codigo) async {
  var url = Uri.parse("http://localhost/ApiParcial/eliminarpaciente.php");

  await http.post(url, body: {
    'codigoeliminar': codigo,
  });
}
