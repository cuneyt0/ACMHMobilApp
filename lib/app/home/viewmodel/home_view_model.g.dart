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

  final _$getAllNoticeAsyncAction =
      AsyncAction('_HomeViewModelBase.getAllNotice');

  @override
  Future<void> getAllNotice() {
    return _$getAllNoticeAsyncAction.run(() => super.getAllNotice());
  }

  final _$getByIdDepartmentAsyncAction =
      AsyncAction('_HomeViewModelBase.getByIdDepartment');

  @override
  Future<dynamic> getByIdDepartment(int? id) {
    return _$getByIdDepartmentAsyncAction
        .run(() => super.getByIdDepartment(id));
  }

  final _$getByIdUserAsyncAction =
      AsyncAction('_HomeViewModelBase.getByIdUser');

  @override
  Future<dynamic> getByIdUser(int? id) {
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
  Future<dynamic> delete(int? id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
dio: ${dio},
responseData: ${responseData},
deleteResponseData: ${deleteResponseData},
departmentGetByIdResponseModel: ${departmentGetByIdResponseModel},
userGetByIdModel: ${userGetByIdModel},
photo: ${photo},
data: ${data},
file: ${file}
    ''';
  }
}
