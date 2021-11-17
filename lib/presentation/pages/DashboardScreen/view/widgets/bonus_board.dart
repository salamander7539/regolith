import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regolith/presentation/pages/DashboardScreen/controller/dashboard_controller.dart';

class BonusBoard extends StatelessWidget {
  const BonusBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Container(
      margin: const EdgeInsets.only(right: 23, left: 23, top: 24),
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFF6C5EF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() {
                  if (controller.loaded.isTrue) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      title: Text(
                        'Ожидаемый бонус',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4), fontSize: 12),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            controller.bonusRUB.isTrue
                                ? '${controller.bonusData!.totalRub}'
                                    .replaceAllMapped(
                                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                        (Match m) => '${m[1]},')
                                : '${controller.bonusData!.totalUsd}'
                                    .replaceAllMapped(
                                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                        (Match m) => '${m[1]},'),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Obx(() {
                            return InkWell(
                              onTap: controller.changeToRub,
                              child: Container(
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.bonusRUB.isTrue
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.1),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    'RUB',
                                    style: TextStyle(
                                      color: controller.bonusRUB.isTrue
                                          ? Colors.black
                                          : Colors.black.withOpacity(0.1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(
                            width: 6,
                          ),
                          Obx(() {
                            return InkWell(
                              onTap: controller.changeToUsd,
                              child: Container(
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.bonusRUB.isFalse
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.1),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    'USD',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: controller.bonusRUB.isFalse
                                          ? Colors.black
                                          : Colors.black.withOpacity(0.1),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              ),
              Icon(
                Icons.error_outline,
                color: Colors.grey.shade400,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 12),
                  title: Text(
                    'В команде',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          'assets/group.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${controller.bonusData!.team}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(20, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SvgPicture.asset('assets/user-plus.svg'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Пополнено RUB',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    '0,00 ₽',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'Выведено RUB',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    '0,00 ₽',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
