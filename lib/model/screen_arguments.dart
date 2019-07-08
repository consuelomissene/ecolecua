import 'package:ecolecua/service/app_config_service.dart';


class ScreenArguments {
  
  final AppConfigService _appConfigService;

  ScreenArguments(this._appConfigService);

  AppConfigService get appConfigService => _appConfigService;


}