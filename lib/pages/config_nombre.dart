import 'package:ecolecua/pages/conoce.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    myController.text = widget.appConfigService.appData.nombre;
    super.initState();
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
            child: continuarButton(widget.appConfigService, context),
          )
        ],
      ),
    );
  }

  Widget continuarButton(
      AppConfigService appConfigService, BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          appConfigService.appData.saveNombre(myController.text);
          print(widget.appConfigService.appData);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ConocePage(appConfigService)));
        },
        color: Theme.of(context).primaryColor,
        child: Text("Continuar", style: TextStyle(color: Colors.white)));
  }
}
