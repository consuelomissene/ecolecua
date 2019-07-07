import 'package:ecolecua/service/app_config_service.dart';
import 'package:ecolecua/service/evaluacion_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/preguntas.dart';

class ConfigNombrePage extends StatefulWidget {
  final AppConfigService appConfigService;

  const ConfigNombrePage(this.appConfigService);
  

  @override
  _ConfigNombreState createState() => new _ConfigNombreState();

}

class _ConfigNombreState extends State<ConfigNombrePage> {

  final myController = TextEditingController();
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Escriba su nombre aqui:'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          SizedBox(
            height: 50,
            width: 140,
            child: continuarButton(context),
          )
        ],
      ),
    );
  }

  Widget continuarButton(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PreguntasPage(new EvaluacionManager())));
        },
        color: Theme.of(context).primaryColor,
        child: Text("Continuar", style: TextStyle(color: Colors.white)));
  }


}