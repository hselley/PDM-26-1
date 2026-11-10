import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake Detection Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ShakeScreen(),
    );
  }
}

class ShakeScreen extends StatefulWidget {
  const ShakeScreen({super.key});

  @override
  State<ShakeScreen> createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  StreamSubscription<UserAccelerometerEvent>? _streamSubscription;
  int _shakeCount = 0;
  DateTime? _lastShakeTime;

  // Umbral de aceleración para considerar que es una agitación (m/s²)
  static const double _shakeThreshold = 15.0;

  // Tiempo mínimo entre detecciones para evitar rebotes (en milisegundos)
  static const int _shakeDebounceMs = 1000;

  @override
  void initState() {
    super.initState();

    // Escuchamos el acelerómetro de usuario (sin gravedad)
    _streamSubscription = userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      // Calculamos la fuerza total mediante teorema de Pitágoras en 3D
      double gForce = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      if (gForce > _shakeThreshold) {
        final now = DateTime.now();

        // Verificamos si ha pasado suficiente tiempo desde el último shake
        if (_lastShakeTime == null || now.difference(_lastShakeTime!).inMilliseconds > _shakeDebounceMs) {
          _lastShakeTime = now;
          setState(() {
            _shakeCount++;
          });

          // Aquí puedes ejecutar cualquier acción, por ejemplo: mostrar un SnackBar
          _onShakeDetected();
        }
      }
    });
  }

  void _onShakeDetected() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Movimiento de agitación detectado! 📳'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de Agitación (Shake)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              '¡Agita tu dispositivo móvil!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Veces agitado: $_shakeCount',
              style: const TextStyle(fontSize: 28, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}