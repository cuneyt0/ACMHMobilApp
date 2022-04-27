// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_getall_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DepartmentGetAllViewModel on _DepartmentGetAllViewModelBase, Store {
  final _$serviceAtom = Atom(name: '_DepartmentGetAllViewModelBase.service');

  @override
  IDepartmentService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IDepartmentService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$departmentGetAllResponseAtom =
      Atom(name: '_DepartmentGetAllViewModelBase.departmentGetAllResponse');

  @override
  DepartmentResponseModel? get departmentGetAllResponse {
    _$departmentGetAllResponseAtom.reportRead();
    return super.departmentGetAllResponse;
  }

  @override
  set departmentGetAllResponse(DepartmentResponseModel? value) {
    _$departmentGetAllResponseAtom
        .reportWrite(value, super.departmentGetAllResponse, () {
      super.departmentGetAllResponse = value;
    });
  }

  final _$departmentDeleteResponseAtom =
      Atom(name: '_DepartmentGetAllViewModelBase.departmentDeleteResponse');

  @override
  BaseResponseModel? get departmentDeleteResponse {
    _$departmentDeleteResponseAtom.reportRead();
    return super.departmentDeleteResponse;
  }

  @override
  set departmentDeleteResponse(BaseResponseModel? value) {
    _$departmentDeleteResponseAtom
        .reportWrite(value, super.departmentDeleteResponse, () {
      super.departmentDeleteResponse = value;
    });
  }

  final _$getAllDepartmentAsyncAction =
      AsyncAction('_DepartmentGetAllViewModelBase.getAllDepartment');

  @override
  Future<DepartmentResponseModel?> getAllDepartment() {
    return _$getAllDepartmentAsyncAction.run(() => super.getAllDepartment());
  }

  final _$deleteDepartmentAsyncAction =
      AsyncAction('_DepartmentGetAllViewModelBase.deleteDepartment');

  @override
  Future<BaseResponseModel?> deleteDepartment(int id) {
    return _$deleteDepartmentAsyncAction.run(() => super.deleteDepartment(id));
  }

  @override
  String toString() {
    return '''
service: ${service},
departmentGetAllResponse: ${departmentGetAllResponse},
departmentDeleteResponse: ${departmentDeleteResponse}
    ''';
  }
}
