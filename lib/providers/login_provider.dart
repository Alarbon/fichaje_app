import 'package:fichaje_app_movil/models/worker_model.dart';
import 'package:fichaje_app_movil/services/signing_workers_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final SigningWorkersService _signingWorkersService = SigningWorkersService();
  String dni = '';
  String? mensaje;

  void writingDni(String value) {
    if (dni.length == 8) {
      return;
    }
    dni += value;

    notifyListeners();
  }

  void clearDni() {
    dni = '';
    notifyListeners();
  }

  Future<void> checkDni() async {
    if (dni.length == 8) {
      Worker? worker =
          await _signingWorkersService.searchWorkerbyDNI(int.parse(dni));
      if (worker != null) {
        await _signingWorkersService.signInWorker(worker);
        mensaje = worker.isLogged
            ? 'Bienvenido ${worker.name} ${worker.lastName}'
            : 'Hasta luego ${worker.name} ${worker.lastName}';
        dni = '';
        notifyListeners();
      }
      if (worker == null) {
        mensaje = 'Fichaje incorrecto, intente de nuevo.';
        dni = '';
        notifyListeners();
      }
      worker = null;
    }
      notifyListeners();
  }

  void clearMensaje() {
    mensaje = null;
    notifyListeners();
  }
}
