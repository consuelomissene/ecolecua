import 'package:ecolecua/pages/config_nombre.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

class ConfigFontPage extends StatefulWidget {
  final AppConfigService appConfigService;

  const ConfigFontPage(this.appConfigService);
  
  @override
  ConfigFontPageState createState() => new ConfigFontPageState();
  
}

class ConfigFontPageState extends State<ConfigFontPage> {
  double _fontSize;
  var configService;

  @override
  void initState() {
    super.initState();
    configService = widget.appConfigService;
    _fontSize = widget.appConfigService.appData.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.fromLTRB(10.0, 40.0, 0.0, 10.0),
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Center(child:
            Text("Mueve el botón hasta que te guste el tamaño de la letra",style:TextStyle(fontSize: _fontSize+10.0)),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Slider(
                value: configService.appData.fontSize,
                min: 22.0,
                max: 26.0,
                divisions: 8,
                //label: '${configService.appData.fontSize.round()}',
                onChanged: (double value) {
                  setState(() => configService.appData.fontSize = value);
                }),
            Padding(
              padding: EdgeInsets.all(15.0),
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
                        print('font configurada en: ${configService.appData.fontSize}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ConfigNombrePage(widget.appConfigService)));
                      },

                      child: Text('Continuar', style: TextStyle(
                          fontSize: _fontSize, color: Colors.white)))
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

