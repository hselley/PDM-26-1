import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Cámara Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VistaFotoScreen(),
    );
  }
}

class VistaFotoScreen extends StatefulWidget {
  const VistaFotoScreen({Key? key}) : super(key: key);

  @override
  State<VistaFotoScreen> createState() => _VistaFotoScreenState();
}

class _VistaFotoScreenState extends State<VistaFotoScreen> {
  // Variable para almacenar la imagen seleccionada
  File? _imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();

  // Función para tomar la foto
  Future<void> _tomarFoto() async {
    final XFile? foto = await _picker.pickImage(source: ImageSource.camera);

    if (foto != null) {
      setState(() {
        // Convertimos el XFile a un File de dart:io para poder usar Image.file
        _imagenSeleccionada = File(foto.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tomar y Mostrar Foto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contenedor para mostrar la imagen o un mensaje si no existe
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _imagenSeleccionada != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                // AQUÍ SE MUESTRA LA FOTO
                child: Image.file(
                  _imagenSeleccionada!,
                  fit: BoxFit.cover,
                ),
              )
                  : const Center(
                child: Text(
                  'No hay foto aún.\nPresiona el botón para tomar una.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _tomarFoto,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Abrir Cámara'),
            ),
          ],
        ),
      ),
    );
  }
}