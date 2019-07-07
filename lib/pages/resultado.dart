import 'package:flutter/material.dart';
import 'home.dart';

class ResultadoPage extends StatelessWidget {
  final int _correctas;

  ResultadoPage(this._correctas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body:
      Center(child: Text('Respuestas correctas: ' + _correctas.toString())),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      HomePage()));
        },
        icon: Icon(Icons.home),
        label: Text('Ir al menú'),
      ),
    );
  }
}
