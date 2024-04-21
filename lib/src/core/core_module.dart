import 'package:code_hero/src/core/data/services/http/http_service.dart';
import 'package:code_hero/src/core/data/services/http/http_service_impl.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addInstance(AppTheme());
    i.add<HttpService>(HttpServiceImp.new);
  }
}
