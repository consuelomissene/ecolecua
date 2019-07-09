import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/facebook/facebook_00b.dart';
import 'package:ecolecua/model/screen_arguments.dart';


class Facebook extends StatelessWidget {
  //Facebook

  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    double _fontSize = args.appConfigService.appData.fontSize;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          "Facebook",
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child:
          Column(
            children: <Widget>[
              Text(
                '¿Qué deseas aprender hoy?',
                style: TextStyle(fontSize: _fontSize),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child:
                ButtonTheme(
                  buttonColor: Colors.lightBlueAccent[100],

                  minWidth: 400.0,
                  height: 50.0,
                  child:
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text('T1: Cómo publicar una imagen',
                        style: TextStyle(fontSize:_fontSize-4, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Facebook00bPage(appConfigService: args.appConfigService)),
                      );
                    },
                  ),
                ),

              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child:
                ButtonTheme(
                  buttonColor: Colors.lightBlueAccent[100],

                  minWidth: 400.0,
                  height: 50.0,
                  child:
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text('Otro tema',
                        style: TextStyle(fontSize:_fontSize-4, fontWeight: FontWeight.w500)),
                    onPressed: () {
                    },
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}