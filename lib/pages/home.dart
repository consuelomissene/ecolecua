import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú',
      home: Scaffold(
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
            FlatButton(
              child: Column(
                children: <Widget>[
                  Image.asset(boton.logo,width: 80, height: 80,),
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
  const Boton({this.title, this.logo});

  final String title;
  final String logo;
}

const List<Boton> botones = const <Boton>[
  const Boton(title: 'Facebook', logo: "assets/images/app_logos/facebook.png"),
  const Boton(title: 'Youtube', logo: "assets/images/app_logos/Youtube.png"),
  const Boton(title: 'Whatsapp', logo: "assets/images/app_logos/whatsapp.png"),
];

