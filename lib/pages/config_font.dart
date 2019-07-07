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
            Text("Presiona el botón + cuando te guste el tamaño de la letra"),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Slider(
                value: configService.appData.fontSize,
                min: 10.0,
                max: 20.0,
                divisions: 10,
                label: '${configService.appData.fontSize.round()}',
                onChanged: (double value) {
                  setState(() => configService.appData.fontSize = value);
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
                    print('font configurada en: ${configService.appData.fontSize}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ConfigNombrePage(widget.appConfigService)));
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
