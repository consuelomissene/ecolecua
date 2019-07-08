import 'package:ecolecua/service/app_config_service.dart';
import 'package:ecolecua/service/evaluacion_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/resultado.dart';

class PreguntasPage extends StatefulWidget {
  final EvaluacionManager evaluacionManager;
  final AppConfigService appConfigService;
  
  const PreguntasPage(this.appConfigService, this.evaluacionManager);

  @override
  _PreguntasState createState() => new _PreguntasState();
}

class _PreguntasState extends State<PreguntasPage> {
  bool _clicked = false;
  var _colorRespuesta;
  String _texto;
  int _index;
  var _evaluacionManager;
  var _appConfigService;

  @override
  void initState() {
    super.initState();
    _evaluacionManager = widget.evaluacionManager;
    _appConfigService = widget.appConfigService;
    _index = _evaluacionManager.preguntaActual;
    _colorRespuesta = new List<Color>.filled(
        _evaluacionManager.preguntas[_index].respuestas.length,
        Colors.blueAccent);
    _texto = _evaluacionManager.preguntas[_index].texto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Pregunta " + (_evaluacionManager.preguntaActual + 1).toString()),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(_texto),
          ),
          Text('Presiona la alternativa que creas correcta'),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Expanded(
            child: respuestas(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_evaluacionManager.esUltimaPregunta()) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ResultadoPage(_appConfigService, _evaluacionManager.correctas)));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PreguntasPage(_appConfigService, _evaluacionManager)));
          }
        },
        label: _evaluacionManager.esUltimaPregunta()
            ? Text("Evaluar")
            : Text("Continuar"),
      ),
    );
  }

  Widget respuestas() {
    var pregunta = _evaluacionManager.preguntas[_index];
    var items = pregunta.respuestas;

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: _colorRespuesta[index],
                child: Text(new String.fromCharCodes([65 + index]),
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),
            title: esImagen(item)
                ? Row(
                    children: <Widget>[
                      Image.asset(
                        item,
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                : Text(item),
            onTap: () {
              bool esCorrecta = pregunta.evalua(index);

              if (_clicked) {
                return null;
              } else {
                setState(() {
                  _colorRespuesta[index] =
                      esCorrecta ? Colors.green : Colors.red;
                  if (esCorrecta) {
                    _evaluacionManager.correctas++;
                  }
                });
                _clicked = true;
                _evaluacionManager.preguntaActual++;
                print('Correctas: ' + _evaluacionManager.correctas.toString());
              }
            },
          );
        });
  }

  bool esImagen(String s) {
    return s.contains('jpeg') || s.contains('png');
  }
}
