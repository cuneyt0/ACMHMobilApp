// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$dioAtom = Atom(name: '_HomeViewModelBase.dio');

  @override
  Dio get dio {
    _$dioAtom.reportRead();
    return super.dio;
  }

  @override
  set dio(Dio value) {
    _$dioAtom.reportWrite(value, super.dio, () {
      super.dio = value;
    });
  }

  final _$responseDataAtom = Atom(name: '_HomeViewModelBase.responseData');

  @override
  NoticeGetAllResponseModel? get responseData {
    _$responseDataAtom.reportRead();
    return super.responseData;
  }

  @override
  set responseData(NoticeGetAllResponseModel? value) {
    _$responseDataAtom.reportWrite(value, super.responseData, () {
      super.responseData = value;
    });
  }

  final _$deleteResponseDataAtom =
      Atom(name: '_HomeViewModelBase.deleteResponseData');

  @override
  NoticeDeleteResponseModel? get deleteResponseData {
    _$deleteResponseDataAtom.reportRead();
    return super.deleteResponseData;
  }

  @override
  set deleteResponseData(NoticeDeleteResponseModel? value) {
    _$deleteResponseDataAtom.reportWrite(value, super.deleteResponseData, () {
      super.deleteResponseData = value;
    });
  }

  final _$departmentGetByIdResponseModelAtom =
      Atom(name: '_HomeViewModelBase.departmentGetByIdResponseModel');

  @override
  DepartmentGetByIdModel? get departmentGetByIdResponseModel {
    _$departmentGetByIdResponseModelAtom.reportRead();
    return super.departmentGetByIdResponseModel;
  }

  @override
  set departmentGetByIdResponseModel(DepartmentGetByIdModel? value) {
    _$departmentGetByIdResponseModelAtom
        .reportWrite(value, super.departmentGetByIdResponseModel, () {
      super.departmentGetByIdResponseModel = value;
    });
  }

  final _$userGetByIdModelAtom =
      Atom(name: '_HomeViewModelBase.userGetByIdModel');

  @override
  UserGetByIdModel? get userGetByIdModel {
    _$userGetByIdModelAtom.reportRead();
    return super.userGetByIdModel;
  }

  @override
  set userGetByIdModel(UserGetByIdModel? value) {
    _$userGetByIdModelAtom.reportWrite(value, super.userGetByIdModel, () {
      super.userGetByIdModel = value;
    });
  }

  final _$serviceAtom = Atom(name: '_HomeViewModelBase.service');

  @override
  IHomeService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IHomeService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$servicetwoAtom = Atom(name: '_HomeViewModelBase.servicetwo');

  @override
  IHomeService get servicetwo {
    _$servicetwoAtom.reportRead();
    return super.servicetwo;
  }

  @override
  set servicetwo(IHomeService value) {
    _$servicetwoAtom.reportWrite(value, super.servicetwo, () {
      super.servicetwo = value;
    });
  }

  final _$photoAtom = Atom(name: '_HomeViewModelBase.photo');

  @override
  dynamic get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(dynamic value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  final _$dataAtom = Atom(name: '_HomeViewModelBase.data');

  @override
  Uint8List? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Uint8List? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$fileAtom = Atom(name: '_HomeViewModelBase.file');

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$getbyidrecentlyresponseAtom =
      Atom(name: '_HomeViewModelBase.getbyidrecentlyresponse');

  @override
  NoticeGetAllResponseModel? get getbyidrecentlyresponse {
    _$getbyidrecentlyresponseAtom.reportRead();
    return super.getbyidrecentlyresponse;
  }

  @override
  set getbyidrecentlyresponse(NoticeGetAllResponseModel? value) {
    _$getbyidrecentlyresponseAtom
        .reportWrite(value, super.getbyidrecentlyresponse, () {
      super.getbyidrecentlyresponse = value;
    });
  }

  final _$getbyidrecentlyActivitiyresponseAtom =
      Atom(name: '_HomeViewModelBase.getbyidrecentlyActivitiyresponse');

  @override
  NoticeGetAllResponseModel? get getbyidrecentlyActivitiyresponse {
    _$getbyidrecentlyActivitiyresponseAtom.reportRead();
    return super.getbyidrecentlyActivitiyresponse;
  }

  @override
  set getbyidrecentlyActivitiyresponse(NoticeGetAllResponseModel? value) {
    _$getbyidrecentlyActivitiyresponseAtom
        .reportWrite(value, super.getbyidrecentlyActivitiyresponse, () {
      super.getbyidrecentlyActivitiyresponse = value;
    });
  }

  final _$aAtom = Atom(name: '_HomeViewModelBase.a');

  @override
  CafeteriaViewModel? get a {
    _$aAtom.reportRead();
    return super.a;
  }

  @override
  set a(CafeteriaViewModel? value) {
    _$aAtom.reportWrite(value, super.a, () {
      super.a = value;
    });
  }

  final _$responseModelAtom = Atom(name: '_HomeViewModelBase.responseModel');

  @override
  NoticeGetAllResponseModel? get responseModel {
    _$responseModelAtom.reportRead();
    return super.responseModel;
  }

  @override
  set responseModel(NoticeGetAllResponseModel? value) {
    _$responseModelAtom.reportWrite(value, super.responseModel, () {
      super.responseModel = value;
    });
  }

  final _$getCafeteriRecentlyAsyncAction =
      AsyncAction('_HomeViewModelBase.getCafeteriRecently');

  @override
  Future<NoticeGetAllResponseModel?> getCafeteriRecently() {
    return _$getCafeteriRecentlyAsyncAction
        .run(() => super.getCafeteriRecently());
  }

  final _$getbyidrecentlyAsyncAction =
      AsyncAction('_HomeViewModelBase.getbyidrecently');

  @override
  Future<NoticeGetAllResponseModel?> getbyidrecently() {
    return _$getbyidrecentlyAsyncAction.run(() => super.getbyidrecently());
  }

  final _$getbyidrecentlyActivitiesAsyncAction =
      AsyncAction('_HomeViewModelBase.getbyidrecentlyActivities');

  @override
  Future<NoticeGetAllResponseModel?> getbyidrecentlyActivities() {
    return _$getbyidrecentlyActivitiesAsyncAction
        .run(() => super.getbyidrecentlyActivities());
  }

  final _$getAllNoticeAsyncAction =
      AsyncAction('_HomeViewModelBase.getAllNotice');

  @override
  Future<NoticeGetAllResponseModel?> getAllNotice() {
    return _$getAllNoticeAsyncAction.run(() => super.getAllNotice());
  }

  final _$getByIdDepartmentAsyncAction =
      AsyncAction('_HomeViewModelBase.getByIdDepartment');

  @override
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id) {
    return _$getByIdDepartmentAsyncAction
        .run(() => super.getByIdDepartment(id));
  }

  final _$getByIdUserAsyncAction =
      AsyncAction('_HomeViewModelBase.getByIdUser');

  @override
  Future<UserGetByIdModel?> getByIdUser(int? id) {
    return _$getByIdUserAsyncAction.run(() => super.getByIdUser(id));
  }

  final _$getImageAsyncAction = AsyncAction('_HomeViewModelBase.getImage');

  @override
  Future<dynamic> getImage(String fileName) {
    return _$getImageAsyncAction.run(() => super.getImage(fileName));
  }

  final _$getPdfShowAsyncAction = AsyncAction('_HomeViewModelBase.getPdfShow');

  @override
  Future<dynamic> getPdfShow(String fileName) {
    return _$getPdfShowAsyncAction.run(() => super.getPdfShow(fileName));
  }

  final _$deleteAsyncAction = AsyncAction('_HomeViewModelBase.delete');

  @override
  Future<NoticeDeleteResponseModel?> delete(int? id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  String dateFormat(DateTime tm) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.dateFormat');
    try {
      return super.dateFormat(tm);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dio: ${dio},
responseData: ${responseData},
deleteResponseData: ${deleteResponseData},
departmentGetByIdResponseModel: ${departmentGetByIdResponseModel},
userGetByIdModel: ${userGetByIdModel},
service: ${service},
servicetwo: ${servicetwo},
photo: ${photo},
data: ${data},
file: ${file},
getbyidrecentlyresponse: ${getbyidrecentlyresponse},
getbyidrecentlyActivitiyresponse: ${getbyidrecentlyActivitiyresponse},
a: ${a},
responseModel: ${responseModel}
    ''';
  }
}
