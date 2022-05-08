import 'package:login_work/app/home/screens/activities/service/IPublicActivityService.dart';
import 'package:login_work/app/home/screens/activities/service/PublicActivityService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'public_activities_view_model.g.dart';

class PublicActivityViewModel = _PublicActivityViewModelBase
    with _$PublicActivityViewModel;

abstract class _PublicActivityViewModelBase with Store {
  @observable
  String? activityName = "Bölüme özel";
  @observable
  String? appbartitle = "Bölüme Özel Etkinlikler";
  @observable
  IPublicActivityService service =
      PublicActivityService(dio: Dio(BaseOptions(baseUrl: activityAllUrl)));
  @observable
  NoticeGetAllResponseModel? getByIdResponse = NoticeGetAllResponseModel();
  @observable
  bool? isChanged = false;
  @action
  Future<void> changed() async {
    isChanged = !isChanged!;
    if (isChanged == true) {
      activityName = 'Genel';
      appbartitle = 'Bölüme Özel Etkinlikler';

      getByIdDepartmentActivity();
    } else {
      activityName = 'Bölüme özel';
      appbartitle = 'Genel Etkinlikler';
      getPublicByIdDepartmentActivity();
    }
  }

  @action
  Future<NoticeGetAllResponseModel?> getByIdDepartmentActivity() async {
    return getByIdResponse = await service.getByIdDepartmentActivity();
  }

  @action
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentActivity() async {
    return getByIdResponse = await service.getPublicByIdDepartmentActivity();
  }
}
