import 'package:ecolecua/model/app_data.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/config_volumen.dart';
import 'package:ecolecua/service/app_config_service.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_00.dart';

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
  double _fontSize;

  @override
  void initState() {
    super.initState();
    _load();
    _fontSize=widget.appConfigService.appData.fontSize;
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
            '/tutorial/whatsapp' : (context) => Whatsapp()
      },
    );
  }
  
  Widget inicio(context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
        child: Center(
          child:
          Column(

              children: <Widget>[
                new Container(
                    child: CircleAvatar(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.blue,
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                    ),
                    width: 310.0,
                    height: 310.0,
                    padding: const EdgeInsets.all(4.0), // borde width
                    decoration: new BoxDecoration(
                      color: Colors.deepOrange, // border color
                      shape: BoxShape.circle,
                    )
                ),

                Container(child:
                Text('Bienvenido $_nombre',style: TextStyle(fontSize: _fontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child:
                  ButtonTheme(
                      minWidth: 250.0,
                      height: 40.0,
                      child: RaisedButton(
                          elevation: 20.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          color:Colors.orangeAccent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => ConfigVolumenPage(
                                        widget.appConfigService)));
                          },
                          child: Text("Empecemos", style: TextStyle(fontSize: _fontSize,color: Colors.white)))
                  ),
                ),
              ]

          ),
        ),


      )
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
          child: Text("Empecemos", style: TextStyle(fontSize: _fontSize,color: Colors.white))),
    );
  }

}
 
  

