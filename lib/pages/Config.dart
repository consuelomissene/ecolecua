import 'package:flutter/material.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:ecolecua/pages/config_font.dart';
import 'home.dart';
import 'config_font.dart';



class ConfiguracionPage extends StatefulWidget {
  final AppConfigService appConfigService;
  const ConfiguracionPage(this.appConfigService);
  @override
  _Configuracion createState() => new _Configuracion();

}

class _Configuracion extends State<ConfiguracionPage> {
  var configService;
  double _fontSize;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    configService = widget.appConfigService;
    _fontSize = widget.appConfigService.appData.fontSize;
    myController.text = widget.appConfigService.appData.nombre;
    super.initState();
    _fontSize = widget.appConfigService.appData.fontSize;
  }
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Edite su nombre aquí abajo:',style: TextStyle(fontSize: _fontSize-4),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                controller: myController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                  ),
                  hintText: widget.appConfigService.appData.nombre,
                  icon: Icon(Icons.edit, semanticLabel: 'Cambiar nombre de usuario',),

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Center(child:Text("Mueve el botón hasta que escuches bien",
                style:TextStyle(fontSize: _fontSize-4)),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Slider(
                value: configService.appData.volumen,
                min: 0.0,
                max: 100.0,
                divisions: 5,
                label: '${configService.appData.volumen.round()}',
                onChanged: (double value) {
                  setState(() => configService.appData.volumen = value);
                }),

            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Center(child:
            Text("Mueve el botón hasta que te guste el tamaño de la letra",style:TextStyle(fontSize: _fontSize-4)),
            ),

            Slider(
                value: configService.appData.fontSize,
                min: 22.0,
                max: 26.0,
                divisions: 8,
                //label: '${configService.appData.fontSize.round()}',
                onChanged: (double value) {
                  setState(() => configService.appData.fontSize = value);
                }),


            Padding(
              padding: EdgeInsets.only(top:60.0),
            ),

              ButtonTheme(
                  minWidth: 250.0,
                  height: 40.0,
                  child: FloatingActionButton.extended(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0))),
               backgroundColor: Colors.orangeAccent,
                      onPressed: () {
                        print('volumen configurado a: ${configService.appData.volumen}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage(widget.appConfigService)));
                      },
                      icon: Icon(Icons.home),
                      label: Text('Volver al menú principal', style: TextStyle(
                          fontSize: _fontSize, color: Colors.white)))
              ),


          ]),
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.orange,title: Text('Configuración', style: TextStyle(fontSize: _fontSize),),),
    );
  }
}
