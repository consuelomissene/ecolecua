import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/config_font.dart';

class ConfigVolumenPage extends StatefulWidget {
  final AppConfigService appConfigService;
  const ConfigVolumenPage(this.appConfigService);
  @override
  _ConfigVolumenState createState() => new _ConfigVolumenState();
  
}

class _ConfigVolumenState extends State<ConfigVolumenPage> {
  var configService;
  double _fontSize;

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
        padding: EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 10.0),
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Center(child:Text("Mueve el botón hasta que escuches bien",
            style:TextStyle(fontSize: _fontSize+10.0)),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Slider(
                value: configService.appData.volumen,
                min: 0.0,
                max: 100.0,
                divisions: 5,
                label: '${configService.appData.volumen.round()}',
                onChanged: (double value) {
                  setState(() => configService.appData.volumen = value);
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
                        print('volumen configurado a: ${configService.appData.volumen}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ConfigFontPage(widget.appConfigService)));
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
