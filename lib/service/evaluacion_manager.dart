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
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed nisl sem, sollicitudin vitae dapibus ac, viverra a dui.",
        [
          "assets/images/iconos/lupa.jpeg",
          "assets/images/iconos/home.jpeg",
          "assets/images/iconos/pause.jpeg",
          "assets/images/iconos/play.jpeg"
        ],
        1));
    preguntas.add(new Pregunta(
        "Cras nec eros a dolor lobortis elementum. "
        "Class aptent taciti sociosqu ad litora torquent per conubia nostra.",
        [
          "Donec interdum ipsum at tempus blandit.",
          "Aliquam pulvinar nulla sed felis mattis, et porttitor purus viverra.",
          "Aenean sodales lorem faucibus tincidunt pellentesque."
        ],
        3));
    preguntas.add(new Pregunta(
        "Ut sed augue ultrices, volutpat ex nec, mollis leo. Praesent eu pellentesque massa.",
        [
          "Mauris sed ligula lobortis, rhoncus urna id, faucibus magna.",
          "Duis sed purus commodo, sagittis enim eget, efficitur ex.",
          "Etiam consequat elit condimentum consequat vulputate."
        ],
        3));
  }

  bool esUltimaPregunta() {
    return preguntaActual == preguntas.length;
  }


}
