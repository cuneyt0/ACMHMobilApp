import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'cafeteria_view_model.g.dart';

class CafeteriaViewModel = _CafeteriaViewModelBase with _$CafeteriaViewModel;

abstract class _CafeteriaViewModelBase with Store {
  @observable
  IPublicCafeteriaService service =
      PublicCafeteriaService(dio: Dio(BaseOptions(baseUrl: cafeteriaAllUrl)));
  @observable
  NoticeGetAllResponseModel? responseModel = NoticeGetAllResponseModel();

  @action
  Future<NoticeGetAllResponseModel?> getCafeteriRecently() async {
    return responseModel = await service.getCafeteriRecently();
  }
}
