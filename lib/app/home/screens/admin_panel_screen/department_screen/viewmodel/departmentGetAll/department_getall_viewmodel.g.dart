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

  final _$idAtom = Atom(name: '_DepartmentGetAllViewModelBase.id');

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

  final _$adminPanelViewModelAtom =
      Atom(name: '_DepartmentGetAllViewModelBase.adminPanelViewModel');

  @override
  AdminPanelViewModel? get adminPanelViewModel {
    _$adminPanelViewModelAtom.reportRead();
    return super.adminPanelViewModel;
  }

  @override
  set adminPanelViewModel(AdminPanelViewModel? value) {
    _$adminPanelViewModelAtom.reportWrite(value, super.adminPanelViewModel, () {
      super.adminPanelViewModel = value;
    });
  }

  final _$departmentNameControllerAtom =
      Atom(name: '_DepartmentGetAllViewModelBase.departmentNameController');

  @override
  TextEditingController get departmentNameController {
    _$departmentNameControllerAtom.reportRead();
    return super.departmentNameController;
  }

  @override
  set departmentNameController(TextEditingController value) {
    _$departmentNameControllerAtom
        .reportWrite(value, super.departmentNameController, () {
      super.departmentNameController = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_DepartmentGetAllViewModelBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_DepartmentGetAllViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
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

  final _$updateDepartmentAsyncAction =
      AsyncAction('_DepartmentGetAllViewModelBase.updateDepartment');

  @override
  Future<dynamic> updateDepartment() {
    return _$updateDepartmentAsyncAction.run(() => super.updateDepartment());
  }

  final _$_DepartmentGetAllViewModelBaseActionController =
      ActionController(name: '_DepartmentGetAllViewModelBase');

  @override
  String? noticeStringValidation(String? value) {
    final _$actionInfo =
        _$_DepartmentGetAllViewModelBaseActionController.startAction(
            name: '_DepartmentGetAllViewModelBase.noticeStringValidation');
    try {
      return super.noticeStringValidation(value);
    } finally {
      _$_DepartmentGetAllViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingView() {
    final _$actionInfo = _$_DepartmentGetAllViewModelBaseActionController
        .startAction(name: '_DepartmentGetAllViewModelBase.changeLoadingView');
    try {
      return super.changeLoadingView();
    } finally {
      _$_DepartmentGetAllViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
service: ${service},
departmentGetAllResponse: ${departmentGetAllResponse},
departmentDeleteResponse: ${departmentDeleteResponse},
id: ${id},
adminPanelViewModel: ${adminPanelViewModel},
departmentNameController: ${departmentNameController},
formKey: ${formKey},
isLoading: ${isLoading}
    ''';
  }
}
