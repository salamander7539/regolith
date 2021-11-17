import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regolith/presentation/pages/DashboardScreen/controller/dashboard_controller.dart';

class RefillBoard extends StatelessWidget {
  const RefillBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Container(
      margin: const EdgeInsets.only(right: 23, left: 23, top: 24),
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFB2B0FF),
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
                        'Пополнено',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 12
                        ),
                      ),
                      subtitle: Text(
                        '${controller.refillData!.total} \$'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
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
                    'Выведено',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                    '${controller.refillData!.withdrawn} \$',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(18  , 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 20,),
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
