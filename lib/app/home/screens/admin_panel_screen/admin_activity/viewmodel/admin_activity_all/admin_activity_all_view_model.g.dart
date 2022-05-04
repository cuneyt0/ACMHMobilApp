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

  final _$getAllActivityAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.getAllActivity');

  @override
  Future<NoticeGetAllResponseModel?> getAllActivity() {
    return _$getAllActivityAsyncAction.run(() => super.getAllActivity());
  }

  final _$deleteDepartmentAsyncAction =
      AsyncAction('_AdminActivityAllViewModelBase.deleteDepartment');

  @override
  Future<BaseResponseModel?> deleteDepartment(int id) {
    return _$deleteDepartmentAsyncAction.run(() => super.deleteDepartment(id));
  }

  @override
  String toString() {
    return '''
activityService: ${activityService},
getAllActivityResponse: ${getAllActivityResponse},
deleteActivityResponse: ${deleteActivityResponse},
id: ${id}
    ''';
  }
}
