import 'package:flutter/material.dart';
import 'package:restaurant_app/models/mesa.dart';
import 'package:restaurant_app/services/database/db_helper.dart';

class GestionMesasScreen extends StatefulWidget {
  @override
  _GestionMesasScreenState createState() => _GestionMesasScreenState();
}

class _GestionMesasScreenState extends State<GestionMesasScreen> {
  DBHelper dbHelper = DBHelper();
  List<Mesa> mesas = [];
  int? mesaSeleccionadaIndex; // Índice temporal para la mesa arrastrada

  @override
  void initState() {
    super.initState();
    cargarMesas();
  }

  // Cargar mesas desde la base de datos
  void cargarMesas() async {
    List<Mesa> mesasDb = await dbHelper.obtenerMesas();
    setState(() {
      mesas = mesasDb;
    });
  }

  // Cambiar posición de mesas al arrastrar y soltar
  void cambiarPosicion(int origen, int destino) {
    setState(() {
      final mesaMovida = mesas.removeAt(origen);
      mesas.insert(destino, mesaMovida);
    });
    guardarOrdenMesas(); // Guardar el nuevo orden
  }

  // Guardar el nuevo orden de las mesas en la base de datos
  Future<void> guardarOrdenMesas() async {
    for (int i = 0; i < mesas.length; i++) {
      Mesa mesa = mesas[i];
      mesa.id = i + 1; // Actualiza el ID según el nuevo orden
      await dbHelper.actualizarEstado(mesa); // Guarda los cambios
    }
  }

  void agregarMesa() async {
    TextEditingController nombreController = TextEditingController();

    bool? confirmacion = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar Mesa'),
        content: TextField(
          controller: nombreController,
          decoration: InputDecoration(labelText: 'Nombre de la Mesa'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Agregar'),
          ),
        ],
      ),
    );

    if (confirmacion == true) {
      // Calcular el siguiente ID disponible (si es requerido)
      int nuevoId = mesas.isEmpty ? 1 : mesas.last.id + 1;

      Mesa nuevaMesa = Mesa(
        id: nuevoId, // Asignar el ID generado
        nombre: nombreController.text,
        estado: 'disponible',
      );

      await dbHelper.insertarMesa(nuevaMesa);
      cargarMesas();
      mostrarSnackBar('Mesa agregada exitosamente');
    }
  }

  // Cambiar el estado de una mesa
  void cambiarEstadoMesa(Mesa mesa, String nuevoEstado) async {
    mesa.estado = nuevoEstado;
    await dbHelper.actualizarEstado(mesa);
    cargarMesas();
    mostrarSnackBar('Estado de la mesa actualizado');
  }

  // Eliminar una mesa
  void eliminarMesa(Mesa mesa) async {
    bool? confirmacion = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Eliminar Mesa'),
        content: Text('¿Estás seguro de que deseas eliminar ${mesa.nombre}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmacion == true) {
      await dbHelper.eliminarMesa(mesa.id);
      cargarMesas();
      mostrarSnackBar('Mesa eliminada exitosamente');
    }
  }

  // Editar una mesa existente
  void editarMesa(Mesa mesa) async {
    TextEditingController nombreController =
        TextEditingController(text: mesa.nombre);
    String nuevoEstado = mesa.estado;

    bool? confirmacion = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Editar Mesa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre de la Mesa'),
            ),
            DropdownButton<String>(
              value: nuevoEstado,
              items: ['disponible', 'ocupada', 'reservada']
                  .map((estado) => DropdownMenuItem(
                        value: estado,
                        child: Text(estado),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  nuevoEstado = value;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Guardar'),
          ),
        ],
      ),
    );

    if (confirmacion == true) {
      mesa.nombre = nombreController.text;
      mesa.estado = nuevoEstado;
      await dbHelper.actualizarEstado(mesa);
      cargarMesas();
      mostrarSnackBar('Mesa actualizada exitosamente');
    }
  }

  // Ordenar mesas por nombre
  void ordenarMesasPorNombre() {
    setState(() {
      mesas.sort((a, b) => a.nombre.compareTo(b.nombre));
    });
    mostrarSnackBar('Mesas ordenadas por nombre');
  }

  // Ordenar mesas por estado
  void ordenarMesasPorEstado() {
    setState(() {
      mesas.sort((a, b) => a.estado.compareTo(b.estado));
    });
    mostrarSnackBar('Mesas ordenadas por estado');
  }

  // Mostrar SnackBar
  void mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Mesas'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: ordenarMesasPorNombre,
            tooltip: 'Ordenar por Nombre',
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: ordenarMesasPorEstado,
            tooltip: 'Ordenar por Estado',
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: agregarMesa,
            tooltip: 'Agregar Mesa',
          ),
        ],
      ),
      body: Column(
        children: [
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
                return DragTarget<int>(
                  onAccept: (origenIndex) {
                    cambiarPosicion(origenIndex, index);
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Draggable<int>(
                      data: index,
                      feedback: Material(
                        color: Colors.transparent,
                        child: _buildMesaCard(mesa, dragging: true),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: _buildMesaCard(mesa),
                      ),
                      child: GestureDetector(
                        onDoubleTap: () => editarMesa(mesa),
                        onLongPress: () => eliminarMesa(mesa),
                        child: _buildMesaCard(mesa),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMesaCard(Mesa mesa, {bool dragging = false}) {
    return Card(
      color: dragging
          ? Colors.blueGrey.withOpacity(0.7)
          : (mesa.estado == 'ocupada' ? Colors.red : Colors.green),
      child: Center(
        child: Text(
          mesa.nombre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
