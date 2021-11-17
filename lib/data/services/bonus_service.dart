import 'package:regolith/data/api/core_api.dart';
import 'package:regolith/data/model/from_api/bonus_model.dart';
import 'package:regolith/domain/dialogs.dart';
import 'package:regolith/internal/locator.dart';

class BonusService {
  final CoreApi _coreApi = locator<CoreApi>();

  Future<BonusData?> getBonus() async {
    final url = _coreApi.bonusUrl;

    final result = await _coreApi.getRequest(url);

    if (result.response != null) {
      return BonusData.fromJson(result.response as Map<String, dynamic>);
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}