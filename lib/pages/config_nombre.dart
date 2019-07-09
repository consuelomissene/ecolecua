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
  double _fontSize;
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
    _fontSize = widget.appConfigService.appData.fontSize;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
        child:Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80.0),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Escriba su nombre aqui:',style: TextStyle(fontSize: _fontSize+10.0),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child:
            ButtonTheme(
                minWidth: 250.0,
                height: 40.0,
                child: RaisedButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0))),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      widget.appConfigService.appData.saveNombre(myController.text);
                      print(widget.appConfigService.appData);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ConocePage(widget.appConfigService)));
                    },
                    child: Text("Empecemos", style: TextStyle(
                        fontSize: _fontSize, color: Colors.white)))
            ),
          ),
        ],
      ),
      ),
    );
  }
//child: continuarButton(widget.appConfigService, context)
}
