import 'package:ecshop/provider_controller/app_theme_provider_or_controller.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AppThemeProvider());
}