import 'package:ecolecua/model/app_data.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/config_volumen.dart';
import 'package:ecolecua/service/app_config_service.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';

void main() {
  runApp(new EcolecuaApp(
    title: 'Ecolecua App',
    appConfigService: AppConfigService(new AppData()),
  ));
}

class EcolecuaApp extends StatefulWidget {

  final String title;
  final appConfigService;

  const EcolecuaApp({Key key, this.title, this.appConfigService}) : super(key: key);


  @override
  _EcolecuaAppState createState() => new _EcolecuaAppState();  
}

class _EcolecuaAppState extends State<EcolecuaApp> {
  
  String _nombre;

  @override
  void initState() {
    super.initState();
    _load();
  }

  //Loading counter value on start
  _load() async {
    await widget.appConfigService.appData.loadNombre();
    await widget.appConfigService.appData.loadTieneEvaluacion();
    setState(() {
      _nombre = widget.appConfigService.appData.nombre ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: widget.title,
      home: Builder(builder: (context) => inicio(context)),
      routes: {
            '/tutorial/whatsapp' : (context) => Whatsapp01Page()
      },
    );
  }
  
  Widget inicio(context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Text('Bienvenido $_nombre' ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
            Image.asset(
              'assets/images/logo.jpg',
              scale: 2,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            empecemosButton(context),
          ]))),
    );
  }

  Widget empecemosButton(context) {
    return SizedBox(
      height: 50,
      width: 140,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ConfigVolumenPage(
                        widget.appConfigService)));
          },
          color: Theme.of(context).primaryColor,
          child: Text("Empecemos", style: TextStyle(color: Colors.white))),
    );
  }

}
 
  

