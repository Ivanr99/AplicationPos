class Mesa {
  int id;
  String nombre;
  String estado;

  Mesa({required this.id, required this.nombre, required this.estado});

  // Métodos para convertir entre JSON y el modelo (si los usas)
  factory Mesa.fromJson(Map<String, dynamic> json) {
    return Mesa(
      id: json['id'],
      nombre: json['nombre'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'estado': estado,
    };
  }
}
