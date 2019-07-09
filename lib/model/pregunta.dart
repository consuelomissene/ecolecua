
class Pregunta {
  var _texto;
  var _respuestas = new List<String>();
  int _correcta;
  String imagen;


  Pregunta(this._texto, this._respuestas, this._correcta, {this.imagen});


  String get texto => _texto;

  bool evalua(int respuesta) {
    return (_correcta == respuesta + 1);
  }

  get respuestas => _respuestas;

}
