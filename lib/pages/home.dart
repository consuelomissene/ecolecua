import 'package:ecolecua/model/screen_arguments.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class HomePage extends StatelessWidget {
  final AppConfigService appConfigService;
  HomePage(this.appConfigService);
  double _fontSize;
    @override
    Widget build(BuildContext context) {
      _fontSize=appConfigService.appData.fontSize;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent[700],
          title: Text('Ecolecuá', style: TextStyle(fontSize: 40.0),),
          bottom: PreferredSize(
              child: AppBar(
                backgroundColor: Colors.orangeAccent[700],
                automaticallyImplyLeading: false,
                actions: <Widget>[

                  ButtonTheme(
                    buttonColor: Colors.orangeAccent[100],

                    minWidth: 60.0,
                    height: 30.0,
                    child:
                    RaisedButton(
                      onPressed: () => {null,
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(
                        //  builder: (context) => Configuracion()),),
                      },
                      color: Colors.orangeAccent[200],
                      padding: EdgeInsets.only(left:10.0, right: 10.0),
                      child: Row(
// Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.settings),
                          Text(
                            "Configuración",
                            style: TextStyle(fontSize: _fontSize),
                          ),
                        ],
                      ),
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0),),
                  FloatingActionButton(
                    backgroundColor: Colors.orangeAccent[200],
                    onPressed: () {null;},
                    child:Icon(Icons.volume_off, semanticLabel: 'Sin sonido',color:Colors.black),
                    elevation: 20.0,

                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0),),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.redAccent[700],
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
// return object of type Dialog
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              title: Text("Salir de la aplicación"),
                              content: Text("¿Deseas salir?",
                                  style: TextStyle(fontSize: 20.0)),
                              actions: <Widget>[
                                RaisedButton(
                                  color:Colors.green,
                                  child: Text('No',
                                      style: TextStyle(
                                          fontSize: _fontSize, color: Colors.white)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),// usually buttons at the bottom of the dialog
                                RaisedButton(
                                  color:Colors.redAccent[700],
                                  child: Text('Sí',
                                      style: TextStyle(
                                          fontSize: _fontSize, color: Colors.white)),
                                  onPressed: () => exit(0),
                                ),

                              ],
                            );
                          },
                        );
                      },
                      icon:Icon(Icons.close),
                      label: Text('salir',style: TextStyle(fontSize: _fontSize),),
                      elevation: 20.0,

                    ),


                ],
              )
              , preferredSize: Size.fromHeight(60.0)),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.symmetric()
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: List.generate(botones.length, (index) {
                  return Center(
                    child: ChoiceCard(
                        appConfigService: appConfigService,
                        boton: botones[index]),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }
}

class ChoiceCard extends StatelessWidget {

  ChoiceCard({Key key, this.boton, this.appConfigService})
      : super(key: key);
  final Boton boton;
  final AppConfigService appConfigService;
  double _fontSize;

  @override
  Widget build(BuildContext context) {
    _fontSize=appConfigService.appData.fontSize;
    return RaisedButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: boton.color,
      splashColor: Colors.transparent,
      child: Column(children: [
        Image(
            image: AssetImage(boton.logo
            ),
            semanticLabel: boton.sem,
            alignment: Alignment.topCenter,
            width: 180.0,
            height: 140.0),
        Text(boton.title,
          style: new TextStyle(fontSize: _fontSize,
            color: boton.colorin
          ))

      ]),
      onPressed: () {
        Navigator.pushNamed(context, boton.route,
            arguments: ScreenArguments(appConfigService));
      },
    );
  }
}

class Boton {
  const Boton({this.title, this.logo, this.label, this.route, this.color, this.sem, this.colorin});

  final String title;
  final String logo;
  final String label;
  final String route;
  final Color color;
  final Color colorin;
  final String sem;
}

const List<Boton> botones = const <Boton>[
const Boton(
title: 'Facebook',
logo: "assets/images/app_logos/facebook.jpg",
label: "Logo de Facebook",
route: null,
color: Color(0xFF01579B),
colorin: Colors.white,
sem: 'Botón a menú de Facebook'
),
  const Boton(
      title: 'WhatsApp',
      logo: "assets/images/app_logos/whatsapp.jpg",
      label: "Logo de WhatsApp",
      route: '/tutorial/whatsapp',
      color: Color(0xFF00C853),
      colorin: Colors.white,
      sem:'Botón a menú de whatsapp'
  ),
  const Boton(
      title: 'Youtube',
      logo: "assets/images/app_logos/youtube.jpg",
      label: "Logo de Youtube",
      route: null,
      color: Colors.white,
    colorin: Colors.black,
    sem: 'botón a menú de Youtube'
  ),

];


