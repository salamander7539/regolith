import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regolith/presentation/pages/DashboardScreen/controller/dashboard_controller.dart';

class ProfitBoard extends StatelessWidget {
  const ProfitBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Container(
      margin: const EdgeInsets.only(right: 23, left: 23, top: 24),
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0F5),
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
                        'Прибыль с акций',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4), fontSize: 12),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.profitData!.total} \$'
                                .replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]},'),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${controller.profitData!.raise} % ',
                                style: const TextStyle(
                                  color: Color(0xFF38D39F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SvgPicture.asset('assets/arrow-up-right.svg'),
                            ],
                          ),
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
            height: 80,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Инестировано',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 12),
                  ),
                  subtitle: Text(
                    '${controller.profitData!.invest} \$'.replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                    style: const TextStyle(
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
                    'Общая стоимость',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 12),
                  ),
                  subtitle: Text(
                    '${controller.profitData!.price} \$'.replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},'),
                    style: const TextStyle(
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
