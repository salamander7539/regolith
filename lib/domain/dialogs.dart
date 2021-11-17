import 'package:get/get.dart';
import 'package:regolith/domain/single_button_dialog.dart';

class ErrorDialog {
  static Future<void> show(String error) async {
    await Get.dialog<void>(SingleButtonDialog(
      titleText: 'Error',
      contentText: error,
      acceptText: 'Ok',
      onAcceptTap: Get.back,
    ));
  }

  static void hide() => Get.back<void>();
}
