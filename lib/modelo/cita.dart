class Cita {
  final String codigocita;
  final String fecha;
  final String hora;
  final String observacion;
  final String estado;
  final String codigopaciente;
  final String nombrepaciente;
  final String apellidopaciente;
  final String edadpaciente;
  final String codigotrabajador;
  final String nombretrabajador;
  final String apellidotrabajador;
  final String tipotrabajador;

  Cita({
    this.codigocita,
    this.fecha,
    this.hora,
    this.observacion,
    this.estado,
    this.codigopaciente,
    this.nombrepaciente,
    this.apellidopaciente,
    this.edadpaciente,
    this.codigotrabajador,
    this.nombretrabajador,
    this.apellidotrabajador,
    this.tipotrabajador,
  });

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      codigocita: json['codigocita'],
      fecha: json['fecha'],
      hora: json['hora'],
      observacion: json['Observacion'],
      estado: json['estado'],
      codigopaciente: json['codigopaciente'],
      nombrepaciente: json['nombrepaciente'],
      apellidopaciente: json['apellidopaciente'],
      edadpaciente: json['edadpaciente'],
      codigotrabajador: json['codigotrabajador'],
      nombretrabajador: json['nombretrabajador'],
      apellidotrabajador: json['apellidotrabajador'],
      tipotrabajador: json['tipotrabajador'],
    );
  }
}
