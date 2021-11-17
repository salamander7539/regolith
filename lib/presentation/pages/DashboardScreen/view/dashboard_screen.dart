import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regolith/presentation/pages/DashboardScreen/controller/dashboard_controller.dart';
import 'package:regolith/presentation/pages/DashboardScreen/view/widgets/bonus_board.dart';
import 'package:regolith/presentation/pages/DashboardScreen/view/widgets/grade_board.dart';
import 'package:regolith/presentation/pages/DashboardScreen/view/widgets/profit_board.dart';
import 'package:regolith/presentation/pages/DashboardScreen/view/widgets/refill_board.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: const [
          GradeBoard(),
          RefillBoard(),
          ProfitBoard(),
          BonusBoard(),
        ],
      ),
    );
  }
}
