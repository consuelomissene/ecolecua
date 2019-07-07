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

  @override
  void initState() {
    super.initState();
    configService = widget.appConfigService;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Text("Presiona el botón + hasta que escuches bien"),
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
            SizedBox(
              height: 50,
              width: 140,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    print('volumen configurado a: ${configService.appData.volumen}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ConfigFontPage(widget.appConfigService)));
                  },
                  color: Theme.of(context).primaryColor,
                  child:
                      Text("Continuar", style: TextStyle(color: Colors.white))),
            )
          ]),
        ),
      ),
    );
  }
}
