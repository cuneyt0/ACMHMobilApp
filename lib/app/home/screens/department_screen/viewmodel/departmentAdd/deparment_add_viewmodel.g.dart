// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deparment_add_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DepartmentAddViewModel on _DepartmentAddViewModelBase, Store {
  final _$serviceAtom = Atom(name: '_DepartmentAddViewModelBase.service');

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

  final _$departmentNameControllerAtom =
      Atom(name: '_DepartmentAddViewModelBase.departmentNameController');

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

  final _$formKeyAtom = Atom(name: '_DepartmentAddViewModelBase.formKey');

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

  final _$isLoadingAtom = Atom(name: '_DepartmentAddViewModelBase.isLoading');

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

  final _$postDepartmentAsyncAction =
      AsyncAction('_DepartmentAddViewModelBase.postDepartment');

  @override
  Future<dynamic> postDepartment() {
    return _$postDepartmentAsyncAction.run(() => super.postDepartment());
  }

  final _$_DepartmentAddViewModelBaseActionController =
      ActionController(name: '_DepartmentAddViewModelBase');

  @override
  String? noticeStringValidation(String? value) {
    final _$actionInfo =
        _$_DepartmentAddViewModelBaseActionController.startAction(
            name: '_DepartmentAddViewModelBase.noticeStringValidation');
    try {
      return super.noticeStringValidation(value);
    } finally {
      _$_DepartmentAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingView() {
    final _$actionInfo = _$_DepartmentAddViewModelBaseActionController
        .startAction(name: '_DepartmentAddViewModelBase.changeLoadingView');
    try {
      return super.changeLoadingView();
    } finally {
      _$_DepartmentAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
service: ${service},
departmentNameController: ${departmentNameController},
formKey: ${formKey},
isLoading: ${isLoading}
    ''';
  }
}
