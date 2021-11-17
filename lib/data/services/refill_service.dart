import 'package:regolith/data/api/core_api.dart';
import 'package:regolith/data/model/from_api/refill_model.dart';
import 'package:regolith/domain/dialogs.dart';
import 'package:regolith/internal/locator.dart';

class RefillService {
  final CoreApi _coreApi = locator<CoreApi>();

  Future<RefillData?> getRefill() async {
    final url = _coreApi.refillUrl;

    final result = await _coreApi.getRequest(url);

    if (result.response != null) {
      return RefillData.fromJson(result.response as Map<String, dynamic>);
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}