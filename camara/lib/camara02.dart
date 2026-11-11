import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart'; // Importante para el almacenamiento permanente


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
      home: const GuardarFotoScreen(),
    );
  }
}

class GuardarFotoScreen extends StatefulWidget {
  const GuardarFotoScreen({Key? key}) : super(key: key);

  @override
  State<GuardarFotoScreen> createState() => _GuardarFotoScreenState();
}

class _GuardarFotoScreenState extends State<GuardarFotoScreen> {
  File? _imagenPermanente;
  final ImagePicker _picker = ImagePicker();

  Future<void> _tomarYGuardarFoto() async {
    // 1. Tomar la foto con la cámara (se guarda temporalmente)
    final XFile? fotoTemporal = await _picker.pickImage(source: ImageSource.camera);

    if (fotoTemporal == null) return;

    // 2. Obtener el directorio permanente de documentos de la aplicación
    final Directory directorioApp = await getApplicationDocumentsDirectory();

    // 3. Crear un nombre de archivo único usando un timestamp
    final String nombreArchivo = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final String rutaPermanente = '${directorioApp.path}/$nombreArchivo';

    // 4. Copiar el archivo temporal a la ruta permanente
    final File imagenGuardada = await File(fotoTemporal.path).copy(rutaPermanente);

    setState(() {
      _imagenPermanente = imagenGuardada;
    });

    // La foto ahora está guardada de forma segura y permanente en:
    print('Imagen guardada en: ${imagenGuardada.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar Foto de Forma Permanente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _imagenPermanente != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _imagenPermanente!,
                  fit: BoxFit.cover,
                ),
              )
                  : const Center(
                child: Text(
                  'Aún no hay foto guardada.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _tomarYGuardarFoto,
              icon: const Icon(Icons.save),
              label: const Text('Tomar y Guardar Foto'),
            ),
          ],
        ),
      ),
    );
  }
}