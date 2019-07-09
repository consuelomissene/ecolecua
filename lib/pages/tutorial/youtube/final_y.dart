import 'package:flutter/material.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:ecolecua/pages/home.dart';
import 'package:ecolecua/pages/tutorial/youtube/youtube_00.dart';

class EcolecuaY extends StatelessWidget{
  final AppConfigService appConfigService;
  EcolecuaY(this.appConfigService);
  double _fontSize;
  @override
  Widget build(BuildContext context) {
    _fontSize=appConfigService.appData.fontSize;
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          child: Center(
            child:
            Column(

                children: <Widget>[
                  new Container(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/logo.jpg'),
                      ),
                      width: 310.0,
                      height: 310.0,
                      padding: const EdgeInsets.all(4.0), // borde width
                      decoration: new BoxDecoration(
                        color: Colors.deepOrange, // border color
                        shape: BoxShape.circle,
                      )
                  ),

                  Text('¡Ecolecuá!', style: TextStyle(fontSize: 40.0, color: Colors.deepOrange,fontWeight: FontWeight.w500),),
                  Center(child:
                  Text('Has completado este ejercicio con éxito.',style: TextStyle(fontSize: _fontSize), maxLines: 2,),
                  ),
                  Container(child:
                  Text('Puedes escoger:',style: TextStyle(fontSize: _fontSize),),
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
                            color: Colors.orangeAccent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(appConfigService)),
                              );
                            },
                            child: Text('Volver al menú principal',style: TextStyle(fontSize: _fontSize,color: Colors.black87)))
                    ),
                  ),
                  Text('o puedes:', style:TextStyle(fontSize: _fontSize)),
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
                                    builder: (context) => Youtube()),
                              );
                            },
                            child: Text('Volver al menú de temas', style: TextStyle(fontSize: _fontSize),))
                    ),
                  ),
                ]

            ),
          ),


        )
    );
  }
}