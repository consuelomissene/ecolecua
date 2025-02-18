import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class ResultadoPage extends StatelessWidget {
  final AppConfigService appConfigService;
  final int _correctas;

  ResultadoPage(this.appConfigService, this._correctas);
  double _fontSize;
  @override
  Widget build(BuildContext context) {
    _fontSize = appConfigService.appData.fontSize;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Resultado:", style: TextStyle(fontSize: _fontSize)),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(50.0),
                child: Column(children: [
                  Text(
                    'Respuestas correctas: ' + _correctas.toString(),
                    style: TextStyle(fontSize: _fontSize),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                    child: Center(
                      child: Text(
                        respuesta(_correctas),
                        style: TextStyle(fontSize: _fontSize),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 100.0)),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HomePage(appConfigService)));
                    },
                    icon: Icon(Icons.home),
                    label: Text('Ir al Menú Principal',style: TextStyle(fontSize: _fontSize),),
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 20.0,
                  ),
                ]))));
  }

  String respuesta(int correctas) {
    if (correctas == 5) {
      return '¡Muy bien!¡Sigue aprendiendo con nosotros!';
    }
    if (correctas >= 3) {
      return 'Vas bien. ¡Continúa aprendiendo con nosotros!';
    }
    return 'Parece que necesitas una mano. ¡Que bueno que podemos ayudarte!';
  }
}
