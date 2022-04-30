// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_announcements_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicAnnouncementViewModel on _PublicAnnouncementViewModelBase, Store {
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

  final _$ChangedAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.Changed');

  @override
  Future<void> Changed() {
    return _$ChangedAsyncAction.run(() => super.Changed());
  }

  final _$departmentGetByIdAsyncAction =
      AsyncAction('_PublicAnnouncementViewModelBase.departmentGetById');

  @override
  Future<NoticeGetAllResponseModel?> departmentGetById() {
    return _$departmentGetByIdAsyncAction.run(() => super.departmentGetById());
  }

  final _$getPublicByIdDepartmentAnnoucementAsyncAction = AsyncAction(
      '_PublicAnnouncementViewModelBase.getPublicByIdDepartmentAnnoucement');

  @override
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentAnnoucement() {
    return _$getPublicByIdDepartmentAnnoucementAsyncAction
        .run(() => super.getPublicByIdDepartmentAnnoucement());
  }

  @override
  String toString() {
    return '''
service: ${service},
getByIdResponse: ${getByIdResponse},
deparmentName: ${deparmentName},
appbartitle: ${appbartitle},
isChanged: ${isChanged}
    ''';
  }
}
