import 'package:flutter/material.dart';

class AlertDialogService {
  Future<void> mostrarAlertaExitosa(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFB9B738),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 50.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'La información se ha guardado correctamente.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> mostrarAlertaError(BuildContext context, String mensaje) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFF78B49),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.error,
              color: Colors.white,
              size: 50.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool>? advertenciaEliminar(BuildContext context) {
    return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    'Eliminar Registro',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Lato",
                    ),
                  ),
                  content: const Text(
                    '¿Esta seguro de eliminar este registro? Esta accion es irreversible.',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Lato",
                    ),
                  ),
                  backgroundColor: const Color(0xFFFFF5FF),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF5FF),
                      ),
                      child: const Text(
                        'Eliminar',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black26,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                  ],
                )
                ).then((value) => value ?? false);
  }
}
