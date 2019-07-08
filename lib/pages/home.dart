import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';

class HomePage extends StatelessWidget {
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
                  child: ChoiceCard(boton: botones[index]),
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
  const ChoiceCard({Key key, this.boton}) : super(key: key);
  final Boton boton;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Whatsapp01Page()));
              },
            )
          ],
        ));
  }
}

class Boton {
  const Boton({this.title, this.logo, this.label, this.page});

  final String title;
  final String logo;
  final String label;
  final Widget page;
}

const List<Boton> botones = const <Boton>[
  const Boton(
      title: 'Facebook',
      logo: "assets/images/app_logos/facebook.jpg",
      label: "Logo de Facebook",
      page: null),
  const Boton(
      title: 'Youtube',
      logo: "assets/images/app_logos/youtube.jpg",
      label: "Logo de Youtube",
      page: null),
  const Boton(
      title: 'WhatsApp',
      logo: "assets/images/app_logos/whatsapp.jpg",
      label: "Logo de WhatsApp",
      page: null),
];
