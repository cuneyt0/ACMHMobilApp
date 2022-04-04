// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnouncementViewModel on _AnnouncementViewModelBase, Store {
  final _$responseDataAtom =
      Atom(name: '_AnnouncementViewModelBase.responseData');

  @override
  DepartmentResponseModel? get responseData {
    _$responseDataAtom.reportRead();
    return super.responseData;
  }

  @override
  set responseData(DepartmentResponseModel? value) {
    _$responseDataAtom.reportWrite(value, super.responseData, () {
      super.responseData = value;
    });
  }

  final _$dioAtom = Atom(name: '_AnnouncementViewModelBase.dio');

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

  final _$dropdownvalueAtom =
      Atom(name: '_AnnouncementViewModelBase.dropdownvalue');

  @override
  Data? get dropdownvalue {
    _$dropdownvalueAtom.reportRead();
    return super.dropdownvalue;
  }

  @override
  set dropdownvalue(Data? value) {
    _$dropdownvalueAtom.reportWrite(value, super.dropdownvalue, () {
      super.dropdownvalue = value;
    });
  }

  final _$getAllDepartmentAsyncAction =
      AsyncAction('_AnnouncementViewModelBase.getAllDepartment');

  @override
  Future<void> getAllDepartment() {
    return _$getAllDepartmentAsyncAction.run(() => super.getAllDepartment());
  }

  @override
  String toString() {
    return '''
responseData: ${responseData},
dio: ${dio},
dropdownvalue: ${dropdownvalue}
    ''';
  }
}
