import 'dart:convert';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void adicionarCita(
    String codigocita,
    String fecha,
    String hora,
    String estado,
    String codigopaciente,
    String nombrepaciente,
    String apellidopaciente,
    String edadpaciente,
    String codigotrabajador,
    String nombretrabajador,
    String apellidotrabajador,
    String tipotrabajador) async {
  var url = Uri.parse("http://localhost/ApiParcial/adicionarcita.php");

  await http.post(url, body: {
    'codigocita': codigocita,
    'fecha': fecha,
    'hora': hora,
    'estado': estado,
    'codigopaciente': codigopaciente,
    'nombrepaciente': nombrepaciente,
    'apellidopaciente': apellidopaciente,
    'edadpaciente': edadpaciente,
    'codigotrabajador': codigotrabajador,
    'nombretrabajador': nombretrabajador,
    'apellidotrabajador': apellidotrabajador,
    'tipotrabajador': tipotrabajador,

  });
}

void editarcita(
    String codigocita,
    String fecha,
    String hora,
    String Observacion,
    String estado) async {
  var url = Uri.parse("http://localhost/ApiParcial/editarcita.php");

  await http.post(url, body: {
    "codigocita": codigocita,
    'fecha': fecha,
    'hora': hora,
    'Observacion': Observacion,
    'estado': estado,
  });
}
