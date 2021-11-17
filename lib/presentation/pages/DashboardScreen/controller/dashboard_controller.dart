import 'package:get/get.dart';
import 'package:regolith/data/model/from_api/bonus_model.dart';
import 'package:regolith/data/model/from_api/grade_model.dart';
import 'package:regolith/data/model/from_api/profit_model.dart';
import 'package:regolith/data/model/from_api/refill_model.dart';
import 'package:regolith/data/services/bonus_service.dart';
import 'package:regolith/data/services/grade_service.dart';
import 'package:regolith/data/services/profit_service.dart';
import 'package:regolith/data/services/refill_service.dart';
import 'package:regolith/internal/locator.dart';

class DashboardController extends GetxController {
  final _bonusService = locator<BonusService>();
  final _refillService = locator<RefillService>();
  final _gradeService = locator<GradeService>();
  final _profitService = locator<ProfitService>();
  final loaded = false.obs;

  BonusData? bonusData = BonusData();

  RefillData? refillData = RefillData();

  RxBool bonusRUB = true.obs;

  GradeData? gradeData = GradeData();

  ProfitData? profitData = ProfitData();

  void changeToRub() {
    bonusRUB.value = true;
  }

  void changeToUsd() {
    bonusRUB.value = false;
  }

  Future getBonus() async {
    loaded.value = false;

    final data = await _bonusService.getBonus();

    if (data != null) {
      bonusData = data;
    }

    loaded.value = true;
  }

  Future getRefill() async {
    loaded.value = false;

    final data = await _refillService.getRefill();

    if (data != null) {
      refillData = data;
    }

    loaded.value = true;
  }

  Future getGrade() async {
    loaded.value = false;

    final data = await _gradeService.getGrade();

    if (data != null) {
      gradeData = data;
    }

    loaded.value = true;
  }

  Future getProfit() async {
    loaded.value = false;

    final data = await _profitService.getProfit();

    if (data != null) {
      profitData = data;
    }

    loaded.value = true;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getBonus();
    getRefill();
    getProfit();
    getGrade();
    super.onInit();
  }

}