import 'package:ecolecua/model/pregunta.dart';


class EvaluacionManager {
  var preguntas = List<Pregunta>();
  int correctas = 0;
  int preguntaActual = 0;

  EvaluacionManager() {
    creaPreguntas();
  }

  void creaPreguntas() {
    preguntas.add(new Pregunta(
        "Youtube: "
        "¿Qué botón debes presionar para pausar un video?",
        [
          "assets/images/iconos/lupa.jpeg",
          "assets/images/iconos/home.jpeg",
          "assets/images/iconos/pause.jpeg",
          "assets/images/iconos/play.jpeg"
        ],
        3));
    preguntas.add(new Pregunta(
        "Youtube:"
        "¿Cuál de estos íconos sirve para buscar un video?",
        [
          "Donec interdum ipsum at tempus blandit.",
          "Aliquam pulvinar nulla sed felis mattis, et porttitor purus viverra.",
          "Aenean sodales lorem faucibus tincidunt pellentesque."
        ],
        3));
    preguntas.add(new Pregunta(
      "Whatsapp:"
        "¿Qué número debes anteponer para agregar un contacto en Whatsapp? ",
        [
          "+578",
          "+350",
          "+569",
          "+541"
        ],
        3));
    preguntas.add(new Pregunta(
  "Whatsapp:"
    "¿Cuál es el ícono para enviar un mensaje de texto? ",
    [
      "+578",
      "+350",
      "+569",
      "+541"
    ],
    4));
    preguntas.add(new Pregunta(
  "Facebook:"
    "¿Cuál de estos íconos sirven para abrir el chat?",
    [
      "+578",
      "+350",
      "+569",
      "+541"
    ],
    2));
    preguntas.add(new Pregunta(
      "Facebook:"
        "¿Para qué sirve este ícono?"
      "assets",
        [
          "Para enviar un mensaje",
          "Para buscar un perfil",
          "Para compartir una publicación",
          "Para sacar una foto"
        ],
        4));
  }

  bool esUltimaPregunta() {
    return preguntaActual == preguntas.length;
  }


}
