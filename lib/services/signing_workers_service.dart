import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fichaje_app_movil/models/signing_model.dart';

import '../models/worker_model.dart';

class SigningWorkersService {
  final _firebaseFirestore = FirebaseFirestore.instance;

  SigningWorkersService();

  Future<Worker?> searchWorkerbyDNI(int dni) async {
    try {
      final response = await _firebaseFirestore
          .collection('workers')
          .where('dni', isEqualTo: dni)
          .get();
      if (response.docs.isEmpty) {
        return null;
      }
      return Worker.fromJson(response.docs.first.data());
    } catch (e) {
      throw Exception('Error al buscar el trabajador');
    }
  }

  Future<Worker> signInWorker(Worker worker) async {
    worker.signings ??= [];
    worker.signings!.add(Signing(
      date: DateTime.now(),
      type: worker.isLogged ? 'Salida' : 'Entrada',
    ));
    worker.isLogged = !worker.isLogged;

    //intento recuperar la id de firebase
    final response = await _firebaseFirestore
        .collection('workers')
        .where('dni', isEqualTo: worker.dni)
        .get();

    //hago un update
    await _firebaseFirestore
        .collection('workers')
        .doc(response.docs.first.id)
        .update(worker.toJson());

    return worker;
  }
}
