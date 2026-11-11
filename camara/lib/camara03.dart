import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';


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
      home: const GaleriaPublicaScreen(),
    );
  }
}

class GaleriaPublicaScreen extends StatefulWidget {
  const GaleriaPublicaScreen({Key? key}) : super(key: key);

  @override
  State<GaleriaPublicaScreen> createState() => _GaleriaPublicaScreenState();
}

class _GaleriaPublicaScreenState extends State<GaleriaPublicaScreen> {
  File? _imagenActual;
  final ImagePicker _picker = ImagePicker();
  String _mensajeEstado = '';

  Future<void> _tomarYGuardarEnGaleria() async {
    // 1. Tomar la foto con la cámara
    final XFile? fotoTemporal = await _picker.pickImage(source: ImageSource.camera);

    if (fotoTemporal == null) return;

    // 2. Guardar la imagen en la galería pública del dispositivo
    // saveFile toma la ruta del archivo temporal y lo indexa en Android MediaStore
    final result = await ImageGallerySaverPlus.saveFile(
      fotoTemporal.path,
      name: 'foto_${DateTime.now().millisecondsSinceEpoch}',
    );

    setState(() {
      _imagenActual = File(fotoTemporal.path);
      if (result['isSuccess'] == true) {
        _mensajeEstado = '¡Foto guardada en la galería pública con éxito!';
      } else {
        _mensajeEstado = 'Error al guardar: ${result['error'] ?? 'Desconocido'}';
      }
    });

    // Verificación en consola del resultado
    print('Resultado de guardado en galería: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar en Galería Pública'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _imagenActual != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(_imagenActual!, fit: BoxFit.cover),
                )
                    : const Center(
                  child: Text(
                    'Presiona el botón para tomar\ny guardar una foto.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _mensajeEstado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _mensajeEstado.contains('éxito') ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _tomarYGuardarEnGaleria,
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Tomar Foto y Publicar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}