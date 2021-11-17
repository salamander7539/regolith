import 'package:regolith/data/api/core_api.dart';
import 'package:regolith/data/model/from_api/grade_model.dart';
import 'package:regolith/domain/dialogs.dart';
import 'package:regolith/internal/locator.dart';

class GradeService {
  final CoreApi _coreApi = locator<CoreApi>();

  Future<GradeData?> getGrade() async {
    final url = _coreApi.gradeUrl;

    final result = await _coreApi.getRequest(url);

    if (result.response != null) {
      return GradeData.fromJson(result.response as Map<String, dynamic>);
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}