
import 'package:intl/intl.dart';


class Validador {
  static String? validarTexto(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese texto';
    }
    return null;
  }

  static String? validarNumero(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese un valor';
    }
    if (double.tryParse(valor) == null) {
      return 'Por favor ingrese un número válido';
    }
    return null;
  }

static String? validarDropdown(dynamic valor) {
    if (valor == null) {
      return 'Por favor seleccione un valor';
    }
    return null;
  }
  static String? validarFecha(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese una fecha';
    }
    try {
      DateFormat.yMMMd().parseStrict(valor);
    } catch (e) {
      return 'Por favor ingrese una fecha válida';
    }
    return null;
  }

  static String? validarHora(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese una hora';
    }
    try {
      DateFormat.jm().parseStrict(valor);
    } catch (e) {
      return 'Por favor ingrese una hora válida';
    }
    return null;
  }
}