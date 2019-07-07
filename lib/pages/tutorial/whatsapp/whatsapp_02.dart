import 'package:flutter/material.dart';

class Whatsapp02Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
        ),
        body: Center(child: Image.asset('assets/images/tutorial/whatsapp/whatsapp-02.png'))
      ),
    );
  }
  
  
  
}