class Empleado {
  final String codigo;
  final String foto;
  final String nombre;
  final String apellido;
  final String tipo;
  final String estado;
  final String trabajo;

  Empleado({
    this.codigo,
    this.foto,
    this.nombre,
    this.apellido,
    this.tipo,
    this.estado,
    this.trabajo,
  });

  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      codigo: json['codigo'],
      foto: json['foto'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      tipo: json['tipo'],
      estado: json['estado'],
      trabajo: json['trabajo'],
    );
  }
}
