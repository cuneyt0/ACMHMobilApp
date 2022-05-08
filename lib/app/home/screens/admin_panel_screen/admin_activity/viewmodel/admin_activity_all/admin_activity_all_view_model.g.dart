// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_activity_all_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminActivityAllViewModel on _AdminActivityAllViewModelBase, Store {
  final _$activityServiceAtom =
      Atom(name: '_AdminActivityAllViewModelBase.activityService');

  @override
  IAdminActivityService get activityService {
    _$activityServiceAtom.reportRead();
    return super.activityService;
  }

  @override
  set activityService(IAdminActivityService value) {
    _$activityServiceAtom.reportWrite(value, super.activityService, () {
      super.activityService = value;
    });
  }

  final _$activityServiceTwoAtom =
      Atom(name: '_AdminActivityAllViewModelBase.activityServiceTwo');

  @override
  IAdminActivityService get activityServiceTwo {
    _$activityServiceTwoAtom.reportRead();
    return super.activityServiceTwo;
  }

  @override
  set activityServiceTwo(IAdminActivityService value) {
    _$activityServiceTwoAtom.reportWrite(value, super.activityServiceTwo, () {
      super.activityServiceTwo = value;
    });
  }

  final _$getAllActivityResponseAtom =
      Atom(name: '_AdminActivityAllViewModelBase.getAllActivityResponse');

  @override
  NoticeGetAllResponseModel? get getAllActivityResponse {
    _$getAllActivityResponseAtom.reportRead();
    return super.getAllActivityResponse;
  }

  @override
  set getAllActivityResponse(NoticeGetAllResponseModel? value) {
    _$getAllActivityResponseAtom
        .reportWrite(value, super.getAllActivityResponse, () {
      super.getAllActivityResponse = value;
    });
  }

  final _$deleteActivityResponseAtom =
      Atom(name: '_AdminActivityAllViewModelBase.deleteActivityResponse');

  @override
  BaseResponseModel? get deleteActivityResponse {
    _$deleteActivityResponseAtom.reportRead();
    return super.deleteActivityResponse;
  }

  @override
  set deleteActivityResponse(BaseResponseModel? value) {
    _$deleteActivityResponseAtom
        .reportWrite(value, super.deleteActivityResponse, () {
      super.deleteActivityResponse = value;
    });
  }

  final _$idAtom = Atom(name: '_AdminActivityAllViewModelBase.id');

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$dioAtom = Atom(name: '_AdminActivityAllViewModelBase.dio');

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

  final _$photoAtom = Atom(name: '_AdminActivityAllViewModelBase.photo');

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

  final _$dataAtom = Atom(name: '_AdminActivityAllViewModelBase.data');

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

  final _$fileAtom = Atom(name: '_AdminActivityAllViewModelBase.file');

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

  final _$departmentGetByIdResponseModelAtom = Atom(
      name: '_AdminActivityAllViewModelBase.departmentGetByIdResponseModel');

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
      Atom(name: '_AdminActivityAllViewModelBase.userGetByIdModel');

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

  final _$getAllActivityAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getAllActivity');

  @override
  Future<NoticeGetAllResponseModel?> getAllActivity() {
    return _$getAllActivityAsyncAction.run(() => super.getAllActivity());
  }

  final _$getByIdUserAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getByIdUser');

  @override
  Future<UserGetByIdModel?> getByIdUser(int? id) {
    return _$getByIdUserAsyncAction.run(() => super.getByIdUser(id));
  }

  final _$getImageAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getImage');

  @override
  Future<dynamic> getImage(String fileName) {
    return _$getImageAsyncAction.run(() => super.getImage(fileName));
  }

  final _$getPdfShowAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getPdfShow');

  @override
  Future<dynamic> getPdfShow(String fileName) {
    return _$getPdfShowAsyncAction.run(() => super.getPdfShow(fileName));
  }

  final _$getByIdDepartmentAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getByIdDepartment');

  @override
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id) {
    return _$getByIdDepartmentAsyncAction
        .run(() => super.getByIdDepartment(id));
  }

  final _$deleteDepartmentAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.deleteDepartment');

  @override
  Future<BaseResponseModel?> deleteDepartment(int id) {
    return _$deleteDepartmentAsyncAction.run(() => super.deleteDepartment(id));
  }

  final _$_AdminActivityAllViewModelBaseActionController =
      ActionController(name: '_AdminActivityAllViewModelBase');

  @override
  String dateFormat(DateTime tm) {
    final _$actionInfo = _$_AdminActivityAllViewModelBaseActionController
        .startAction(name: '_AdminActivityAllViewModelBase.dateFormat');
    try {
      return super.dateFormat(tm);
    } finally {
      _$_AdminActivityAllViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityService: ${activityService},
activityServiceTwo: ${activityServiceTwo},
getAllActivityResponse: ${getAllActivityResponse},
deleteActivityResponse: ${deleteActivityResponse},
id: ${id},
dio: ${dio},
photo: ${photo},
data: ${data},
file: ${file},
departmentGetByIdResponseModel: ${departmentGetByIdResponseModel},
userGetByIdModel: ${userGetByIdModel}
    ''';
  }
}
