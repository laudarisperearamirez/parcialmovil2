class Paciente {
  final String codigo;
  final String foto;
  final String nombre;
  final String apellido;
  final String fechanacimiento;
  final String edad;
  final String direccion;
  final String barrio;
  final String telefono;
  final String ciudad;
  final String estado;

    

  Paciente({
    this.codigo,
    this.foto,
    this.nombre,
    this.apellido,
    this.fechanacimiento,
    this.edad,
    this.direccion,
    this.barrio,
    this.telefono,
    this.ciudad,
    this.estado,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      codigo: json['codigo'],
      foto: json['foto'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      fechanacimiento: json['fechanacimiento'],
      edad: json['edad'],
      direccion: json['direccion'],
      barrio: json['barrio'],
      telefono: json['telefono'],
      ciudad: json['ciudad'],
      estado: json['estado'],

    );
  }
}
