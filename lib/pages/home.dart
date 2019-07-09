import 'package:ecolecua/model/screen_arguments.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AppConfigService appConfigService;

  const HomePage(this.appConfigService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(30),
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

  const ChoiceCard({Key key, this.boton, this.appConfigService})
      : super(key: key);
  final Boton boton;
  final AppConfigService appConfigService;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: boton.color,
      child: Column(children: [
        Image(
            image: AssetImage(boton.logo
            ),
            semanticLabel: boton.sem,
            alignment: Alignment.topCenter,
            width: 180.0,
            height: 140.0),
        Text(boton.title,
          style: new TextStyle(
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
      title: 'Youtube',
      logo: "assets/images/app_logos/youtube.jpg",
      label: "Logo de Youtube",
      route: null,
      color: Colors.white,
    colorin: Colors.black,
    sem: 'botón a menú de Youtube'
  ),
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
    colorin: Colors.black,
    sem:'Botón a menú de whatsapp'
  ),
];
