// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_activities_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicActivityViewModel on _PublicActivityViewModelBase, Store {
  final _$activityNameAtom =
      Atom(name: '_PublicActivityViewModelBase.activityName');

  @override
  String? get activityName {
    _$activityNameAtom.reportRead();
    return super.activityName;
  }

  @override
  set activityName(String? value) {
    _$activityNameAtom.reportWrite(value, super.activityName, () {
      super.activityName = value;
    });
  }

  final _$appbartitleAtom =
      Atom(name: '_PublicActivityViewModelBase.appbartitle');

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

  final _$serviceAtom = Atom(name: '_PublicActivityViewModelBase.service');

  @override
  IPublicActivityService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IPublicActivityService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$getByIdResponseAtom =
      Atom(name: '_PublicActivityViewModelBase.getByIdResponse');

  @override
  NoticeGetAllResponseModel? get getByIdResponse {
    _$getByIdResponseAtom.reportRead();
    return super.getByIdResponse;
  }

  @override
  set getByIdResponse(NoticeGetAllResponseModel? value) {
    _$getByIdResponseAtom.reportWrite(value, super.getByIdResponse, () {
      super.getByIdResponse = value;
    });
  }

  final _$isChangedAtom = Atom(name: '_PublicActivityViewModelBase.isChanged');

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

  final _$changedAsyncAction =
      AsyncAction('_PublicActivityViewModelBase.changed');

  @override
  Future<void> changed() {
    return _$changedAsyncAction.run(() => super.changed());
  }

  final _$getByIdDepartmentActivityAsyncAction =
      AsyncAction('_PublicActivityViewModelBase.getByIdDepartmentActivity');

  @override
  Future<NoticeGetAllResponseModel?> getByIdDepartmentActivity() {
    return _$getByIdDepartmentActivityAsyncAction
        .run(() => super.getByIdDepartmentActivity());
  }

  final _$getPublicByIdDepartmentActivityAsyncAction = AsyncAction(
      '_PublicActivityViewModelBase.getPublicByIdDepartmentActivity');

  @override
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentActivity() {
    return _$getPublicByIdDepartmentActivityAsyncAction
        .run(() => super.getPublicByIdDepartmentActivity());
  }

  @override
  String toString() {
    return '''
activityName: ${activityName},
appbartitle: ${appbartitle},
service: ${service},
getByIdResponse: ${getByIdResponse},
isChanged: ${isChanged}
    ''';
  }
}
