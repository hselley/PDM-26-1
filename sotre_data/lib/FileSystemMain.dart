// FileSystemMain.dart

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Ubicacion del archivo: /data/data/com.example.store_data/app_flutter/miArchivo.txt

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File system demo',
      home: FileSystemDemo(),
    );
  }
}

class FileSystemDemo extends StatefulWidget {
  @override
  _FileSystemDemoState createState() => _FileSystemDemoState();
}

class _FileSystemDemoState extends State<FileSystemDemo> {
  // Variables de estado
  String _contenidoArchivo = '';
  final TextEditingController _textoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _leerArchivo();
  }

  _crearArchivo() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/miArchivo.txt');

    await file.writeAsString('Este es un archivo creado por Flutter\n');
    await file.writeAsString('Segunda línea del archivo\n', mode: FileMode.append);

    setState(() async {
      _contenidoArchivo = await file.readAsString();
    });
  }

  _leerArchivo() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/miArchivo.txt');

      if(await file.exists()) {
        String contenido = await file.readAsString();
        setState(() {
          _contenidoArchivo = contenido;
        });
      } else {
        setState(() {
          _contenidoArchivo = 'Archivo no encontrado';
        });
      }
    } catch(e) {
      setState(() {
        _contenidoArchivo = 'Error al leer el archivo $e';
      });
    }
  }

  _escribirArchivo() async {
    if(_textoController.text.isNotEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/miArchivo.txt');

      await file.writeAsString('${_textoController.text}\n', mode: FileMode.append);

      _leerArchivo();
      _textoController.clear();
    }
  }

  _borrarArchivo() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/miArchivo.txt');

      if(await file.exists()) {
        await file.delete();
        setState(() {
          _contenidoArchivo = 'Archivo Borrado';
        });
      }
    } catch(e) {
      setState(() {
        _contenidoArchivo = 'Error al borrar el archivo $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File System Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _crearArchivo,
              child: Text('Crear Archivo'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _borrarArchivo,
              child: Text('Borrar Archivo'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textoController,
              decoration: InputDecoration(
                labelText: 'Texto para añadir al archivo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _escribirArchivo,
              child: Text('Escribir en archivo'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _contenidoArchivo.isEmpty ? 'No hay contenido' : _contenidoArchivo,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}