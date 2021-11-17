import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regolith/presentation/pages/DashboardScreen/controller/dashboard_controller.dart';

class GradeBoard extends StatelessWidget {
  const GradeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Container(
      margin: const EdgeInsets.only(right: 23, left: 23, top: 24),
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFE5FFF5),
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
                        'Оценка портфеля',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 12
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.gradeData!.total} \$'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${controller.gradeData!.raise} % ',
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
            height: 20,
          ),
          Stack(
            children: [
              Container(
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF6D3EFF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFF38D39F),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: MediaQuery.of(context).size.width * .44,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6D3EFF),
                    ),
                    height: 6,
                    width: 6,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'В акциях',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${controller.gradeData!.stock} \$'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF38D39F),
                    ),
                    height: 6,
                    width: 6,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Остаток USD',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${controller.gradeData!.balanceUsd} \$'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD25E),
                    ),
                    height: 6,
                    width: 6,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Остаток RUB',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${controller.gradeData!.balanceRub} \$'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
