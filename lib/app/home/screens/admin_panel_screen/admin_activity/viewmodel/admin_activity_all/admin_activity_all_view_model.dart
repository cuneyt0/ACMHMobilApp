import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_activity_all_view_model.g.dart';

class AdminActivityAllViewModel = _AdminActivityAllViewModelBase
    with _$AdminActivityAllViewModel;

abstract class _AdminActivityAllViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IAdminActivityService activityService =
      AdminActivityService(dio: Dio(BaseOptions(baseUrl: activityAllUrl)));
  @observable
  NoticeGetAllResponseModel? getAllActivityResponse =
      NoticeGetAllResponseModel();
  @observable
  BaseResponseModel? deleteActivityResponse = BaseResponseModel();
  @observable
  int? id;
  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
  @action
  Future<NoticeGetAllResponseModel?> getAllActivity() async {
    return getAllActivityResponse = await activityService.getAllActivity();
  }

  @action
  Future<BaseResponseModel?> deleteDepartment(int id) async {
    deleteActivityResponse = await activityService.deleteActivity(id);
    await getAllActivity();
    Flushbar(
      message: '${deleteActivityResponse?.message}',
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(2),
      backgroundColor: Colors.black.withOpacity(0.5),
    ).show(buildContext).then((value) => Navigation.ofPop());
    return deleteActivityResponse;
  }
}
