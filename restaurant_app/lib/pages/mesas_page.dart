import 'package:flutter/material.dart';
import 'package:restaurant_app/models/mesa.dart';

class GestionMesasScreen extends StatefulWidget {
  @override
  _GestionMesasScreenState createState() => _GestionMesasScreenState();
}

class _GestionMesasScreenState extends State<GestionMesasScreen> {
  List<Mesa> mesas = [
    Mesa(id: 1, nombre: 'Mesa 1'),
    Mesa(id: 2, nombre: 'Mesa 2'),
    Mesa(id: 3, nombre: 'Mesa 3'),
    Mesa(id: 4, nombre: 'Mesa 4'),
    // Las mesas iniciales pueden ser estáticas o cargadas desde una base de datos
  ];

  // Función para agregar una nueva mesa
  void agregarMesa() {
    setState(() {
      int nuevoId = mesas.length + 1;
      String nombre = 'Mesa $nuevoId';
      mesas.add(Mesa(id: nuevoId, nombre: nombre));
    });
  }

  // Función para cambiar el estado de la mesa
  void cambiarEstadoMesa(Mesa mesa) {
    setState(() {
      mesa.cambiarEstado(
          mesa.estado == 'disponible' ? 'ocupada' : 'disponible');
    });
  }

  // Función para modificar el layout de mesas (ejemplo de reorganización)
  void modificarLayout() {
    // Aquí podrías agregar la lógica para modificar el layout
    // Como reorganizar las mesas, moverlas de lugar, etc.
    setState(() {
      // Simulamos una "reordenación" con un simple cambio de estado
      mesas.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Mesas'),
      ),
      body: Column(
        children: [
          // Botón para agregar mesa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: agregarMesa,
              child: Text('Agregar Mesa'),
            ),
          ),
          // Botón para modificar layout
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: modificarLayout,
              child: Text('Modificar Layout'),
            ),
          ),
          // Vista de mesas
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: mesas.length,
              itemBuilder: (context, index) {
                final mesa = mesas[index];
                return GestureDetector(
                  onTap: () => cambiarEstadoMesa(mesa),
                  child: Card(
                    color: mesa.estado == 'ocupada' ? Colors.red : Colors.green,
                    child: Center(
                      child: Text(
                        mesa.nombre,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
