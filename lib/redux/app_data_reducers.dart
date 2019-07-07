import 'app_config_action.dart';
import 'package:ecolecua/model/app_data.dart';

AppData appDataReducer(appdata, dynamic action) {
  if (action is ConfigNombreAction) {
    return setNombre(appdata, action);
  } else if (action is ConfigFontSizeAction) {
    return setFontSize(appdata, action);
  }
  return appdata;
}

AppData setFontSize(appdata, ConfigFontSizeAction action) {
  appdata.fontSize = action.fontSize;
  return appdata;
}

AppData setNombre(appdata, ConfigNombreAction action) {
  appdata.nombreUsuario = action.nombre;
  return appdata;
}

