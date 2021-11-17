import 'package:regolith/data/api/core_api.dart';
import 'package:regolith/data/model/from_api/profit_model.dart';
import 'package:regolith/domain/dialogs.dart';
import 'package:regolith/internal/locator.dart';

class ProfitService {
  final CoreApi _coreApi = locator<CoreApi>();

  Future<ProfitData?> getProfit() async {
    final url = _coreApi.profitUrl;

    final result = await _coreApi.getRequest(url);

    if (result.response != null) {
      return ProfitData.fromJson(result.response as Map<String, dynamic>);
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}