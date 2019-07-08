
class AppData {
  String nombre;
  double fontSize;
  double volumen;

  AppData() {
    volumen = 50.0;
    fontSize = 12.0;
  }

  @override
  String toString() {
    return 'AppData{nombre: $nombre, fontSize: $fontSize, volumen: $volumen}';
  }


}
