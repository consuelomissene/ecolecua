import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  String nombre;
  double fontSize;
  double volumen;
  bool tieneEvaluacion;

  AppData() {
    volumen = 50.0;
    fontSize = 22.0;
    tieneEvaluacion = false;
  }

  @override
  String toString() {
    return 'AppData{nombre: $nombre, fontSize: $fontSize, volumen: $volumen}';
  }

  loadNombre() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    nombre = prefs.getString("nombre");
  }
  
  saveNombre(String nombre) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nombre", nombre);
    this.nombre = nombre; 
  }

  loadTieneEvaluacion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    tieneEvaluacion = prefs.getBool("tieneEvaluacion");
  }

  saveTieneEvaluacion(bool tieneEvaluacion) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("tieneEvaluacion", tieneEvaluacion);
    this.tieneEvaluacion = tieneEvaluacion;
  }
  


}
