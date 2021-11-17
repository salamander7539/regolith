import 'package:get_it/get_it.dart';
import 'package:regolith/data/api/core_api.dart';
import 'package:regolith/data/services/bonus_service.dart';
import 'package:regolith/data/services/grade_service.dart';
import 'package:regolith/data/services/profit_service.dart';
import 'package:regolith/data/services/refill_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton(() => CoreApi());
  locator.registerLazySingleton(() => BonusService());
  locator.registerLazySingleton(() => GradeService());
  locator.registerLazySingleton(() => ProfitService());
  locator.registerLazySingleton(() => RefillService());
}