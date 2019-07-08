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
    return Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    boton.logo,
                    width: 80,
                    height: 80,
                    alignment: Alignment.topCenter,
                  ),
                  Text(boton.title)
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, boton.route,
                    arguments: ScreenArguments(appConfigService));
              },
            )
          ],
        ));
  }
}

class Boton {
  const Boton({this.title, this.logo, this.label, this.route});

  final String title;
  final String logo;
  final String label;
  final String route;
}

const List<Boton> botones = const <Boton>[
  const Boton(
      title: 'Facebook',
      logo: "assets/images/app_logos/facebook.jpg",
      label: "Logo de Facebook",
      route: null),
  const Boton(
      title: 'Youtube',
      logo: "assets/images/app_logos/youtube.jpg",
      label: "Logo de Youtube",
      route: null),
  const Boton(
      title: 'WhatsApp',
      logo: "assets/images/app_logos/whatsapp.jpg",
      label: "Logo de WhatsApp",
      route: '/tutorial/whatsapp'),
];
