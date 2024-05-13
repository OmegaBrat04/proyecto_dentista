import 'package:intl/intl.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Clientes.dart';

class Validador {
  static Cdor_Clientes controladorClientes = Cdor_Clientes();

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
    if (valor.isNotEmpty && double.tryParse(valor) == null) {
      return 'Por favor ingrese un número válido';
    }
    return null;
  }

  static Future<String?> validarAutocomplete(dynamic valor) async {
    if (valor == null || valor.isEmpty) {
      return 'Por favor seleccione un valor';
    }
    List<String> nombresClientes =
        await controladorClientes.listarNombresClientes();
    if (!nombresClientes.contains(valor)) {
      return 'Por favor seleccione un cliente válido';
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
      DateFormat('yyyy-MM-dd').parseStrict(valor);
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
      final partesTiempo = valor.split(':');
      if (partesTiempo.length != 2) {
        return 'Por favor ingrese una hora válida';
      }
      final hora = int.parse(partesTiempo[0]);
      final minutosPeriodo = partesTiempo[1].split(' ');
      if (minutosPeriodo.length != 2) {
        return 'Por favor ingrese una hora válida';
      }
      final minutos = int.parse(minutosPeriodo[0]);
      final periodos = minutosPeriodo[1];
      if (hora < 1 ||
          hora > 12 ||
          minutos < 0 ||
          minutos > 59 ||
          (periodos != 'AM' && periodos != 'PM')) {
        return 'Por favor ingrese una hora válida';
      }
    } catch (e) {
      return 'Por favor ingrese una hora válida';
    }
    return null;
  }
}
