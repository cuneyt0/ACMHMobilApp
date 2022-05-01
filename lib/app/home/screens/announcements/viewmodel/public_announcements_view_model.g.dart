// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_announcements_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicAnnouncementViewModel on _PublicAnnouncementViewModelBase, Store {
  final _$dioAtom = Atom(name: '_PublicAnnouncementViewModelBase.dio');

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

  final _$serviceAtom = Atom(name: '_PublicAnnouncementViewModelBase.service');

  @override
  IPublicAnnoucementService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IPublicAnnoucementService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$servicetwoAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.servicetwo');

  @override
  IPublicAnnoucementService get servicetwo {
    _$servicetwoAtom.reportRead();
    return super.servicetwo;
  }

  @override
  set servicetwo(IPublicAnnoucementService value) {
    _$servicetwoAtom.reportWrite(value, super.servicetwo, () {
      super.servicetwo = value;
    });
  }

  final _$servicetreeAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.servicetree');

  @override
  IPublicAnnoucementService get servicetree {
    _$servicetreeAtom.reportRead();
    return super.servicetree;
  }

  @override
  set servicetree(IPublicAnnoucementService value) {
    _$servicetreeAtom.reportWrite(value, super.servicetree, () {
      super.servicetree = value;
    });
  }

  final _$getByIdResponseAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.getByIdResponse');

  @override
  NoticeGetAllResponseModel get getByIdResponse {
    _$getByIdResponseAtom.reportRead();
    return super.getByIdResponse;
  }

  @override
  set getByIdResponse(NoticeGetAllResponseModel value) {
    _$getByIdResponseAtom.reportWrite(value, super.getByIdResponse, () {
      super.getByIdResponse = value;
    });
  }

  final _$departmentIdResponseAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.departmentIdResponse');

  @override
  DepartmentGetByIdModel get departmentIdResponse {
    _$departmentIdResponseAtom.reportRead();
    return super.departmentIdResponse;
  }

  @override
  set departmentIdResponse(DepartmentGetByIdModel value) {
    _$departmentIdResponseAtom.reportWrite(value, super.departmentIdResponse,
        () {
      super.departmentIdResponse = value;
    });
  }

  final _$userGetByIdModelAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.userGetByIdModel');

  @override
  UserGetByIdModel get userGetByIdModel {
    _$userGetByIdModelAtom.reportRead();
    return super.userGetByIdModel;
  }

  @override
  set userGetByIdModel(UserGetByIdModel value) {
    _$userGetByIdModelAtom.reportWrite(value, super.userGetByIdModel, () {
      super.userGetByIdModel = value;
    });
  }

  final _$deparmentNameAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.deparmentName');

  @override
  String? get deparmentName {
    _$deparmentNameAtom.reportRead();
    return super.deparmentName;
  }

  @override
  set deparmentName(String? value) {
    _$deparmentNameAtom.reportWrite(value, super.deparmentName, () {
      super.deparmentName = value;
    });
  }

  final _$appbartitleAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.appbartitle');

  @override
  String? get appbartitle {
    _$appbartitleAtom.reportRead();
    return super.appbartitle;
  }

  @override
  set appbartitle(String? value) {
    _$appbartitleAtom.reportWrite(value, super.appbartitle, () {
      super.appbartitle = value;
    });
  }

  final _$isChangedAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.isChanged');

  @override
  bool? get isChanged {
    _$isChangedAtom.reportRead();
    return super.isChanged;
  }

  @override
  set isChanged(bool? value) {
    _$isChangedAtom.reportWrite(value, super.isChanged, () {
      super.isChanged = value;
    });
  }

  final _$denemeResponseAtom =
      Atom(name: '_PublicAnnouncementViewModelBase.denemeResponse');

  @override
  Uint8List? get denemeResponse {
    _$denemeResponseAtom.reportRead();
    return super.denemeResponse;
  }

  @override
  set denemeResponse(Uint8List? value) {
    _$denemeResponseAtom.reportWrite(value, super.denemeResponse, () {
      super.denemeResponse = value;
    });
  }

  final _$photoAtom = Atom(name: '_PublicAnnouncementViewModelBase.photo');

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

  final _$dataAtom = Atom(name: '_PublicAnnouncementViewModelBase.data');

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

  final _$fileAtom = Atom(name: '_PublicAnnouncementViewModelBase.file');

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

  final _$changedAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.changed');

  @override
  Future<void> changed() {
    return _$changedAsyncAction.run(() => super.changed());
  }

  final _$getImageAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.getImage');

  @override
  Future<dynamic> getImage(String fileName) {
    return _$getImageAsyncAction.run(() => super.getImage(fileName));
  }

  final _$getPdfShowAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.getPdfShow');

  @override
  Future<dynamic> getPdfShow(String fileName) {
    return _$getPdfShowAsyncAction.run(() => super.getPdfShow(fileName));
  }

  final _$departmentGetByIdAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.departmentGetById');

  @override
  Future<NoticeGetAllResponseModel?> departmentGetById() {
    return _$departmentGetByIdAsyncAction.run(() => super.departmentGetById());
  }

  final _$getByIdDepartmentAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.getByIdDepartment');

  @override
  Future<DepartmentGetByIdModelBody?> getByIdDepartment() {
    return _$getByIdDepartmentAsyncAction.run(() => super.getByIdDepartment());
  }

  final _$getPublicByIdDepartmentAnnoucementAsyncAction = AsyncAction(
      '_PublicAnnouncementViewModelBase.getPublicByIdDepartmentAnnoucement');

  @override
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentAnnoucement() {
    return _$getPublicByIdDepartmentAnnoucementAsyncAction
        .run(() => super.getPublicByIdDepartmentAnnoucement());
  }

  final _$getByIdUserAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.getByIdUser');

  @override
  Future<UserGetByIdModel?> getByIdUser() {
    return _$getByIdUserAsyncAction.run(() => super.getByIdUser());
  }

  final _$_PublicAnnouncementViewModelBaseActionController =
      ActionController(name: '_PublicAnnouncementViewModelBase');

  @override
  String dateFormat(DateTime tm) {
    final _$actionInfo = _$_PublicAnnouncementViewModelBaseActionController
        .startAction(name: '_PublicAnnouncementViewModelBase.dateFormat');
    try {
      return super.dateFormat(tm);
    } finally {
      _$_PublicAnnouncementViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dio: ${dio},
service: ${service},
servicetwo: ${servicetwo},
servicetree: ${servicetree},
getByIdResponse: ${getByIdResponse},
departmentIdResponse: ${departmentIdResponse},
userGetByIdModel: ${userGetByIdModel},
deparmentName: ${deparmentName},
appbartitle: ${appbartitle},
isChanged: ${isChanged},
denemeResponse: ${denemeResponse},
photo: ${photo},
data: ${data},
file: ${file}
    ''';
  }
}
