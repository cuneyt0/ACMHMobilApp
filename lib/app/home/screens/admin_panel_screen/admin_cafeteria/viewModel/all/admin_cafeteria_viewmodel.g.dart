// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_cafeteria_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminCafeteriaGetAllViewModel
    on _AdminCafeteriaGetAllViewModelBase, Store {
  final _$dataAtom = Atom(name: '_AdminCafeteriaGetAllViewModelBase.data');

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

  final _$fileAtom = Atom(name: '_AdminCafeteriaGetAllViewModelBase.file');

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

  final _$dioAtom = Atom(name: '_AdminCafeteriaGetAllViewModelBase.dio');

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

  final _$cafeteriaServiceAtom =
      Atom(name: '_AdminCafeteriaGetAllViewModelBase.cafeteriaService');

  @override
  IAdminCafeteriaService get cafeteriaService {
    _$cafeteriaServiceAtom.reportRead();
    return super.cafeteriaService;
  }

  @override
  set cafeteriaService(IAdminCafeteriaService value) {
    _$cafeteriaServiceAtom.reportWrite(value, super.cafeteriaService, () {
      super.cafeteriaService = value;
    });
  }

  final _$getAllResponseAtom =
      Atom(name: '_AdminCafeteriaGetAllViewModelBase.getAllResponse');

  @override
  NoticeGetAllResponseModel? get getAllResponse {
    _$getAllResponseAtom.reportRead();
    return super.getAllResponse;
  }

  @override
  set getAllResponse(NoticeGetAllResponseModel? value) {
    _$getAllResponseAtom.reportWrite(value, super.getAllResponse, () {
      super.getAllResponse = value;
    });
  }

  final _$deleteResponseAtom =
      Atom(name: '_AdminCafeteriaGetAllViewModelBase.deleteResponse');

  @override
  BaseResponseModel? get deleteResponse {
    _$deleteResponseAtom.reportRead();
    return super.deleteResponse;
  }

  @override
  set deleteResponse(BaseResponseModel? value) {
    _$deleteResponseAtom.reportWrite(value, super.deleteResponse, () {
      super.deleteResponse = value;
    });
  }

  final _$userGetByIdModelAtom =
      Atom(name: '_AdminCafeteriaGetAllViewModelBase.userGetByIdModel');

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

  final _$getAllCafeteriaAsyncAction =
      AsyncAction('_AdminCafeteriaGetAllViewModelBase.getAllCafeteria');

  @override
  Future<NoticeGetAllResponseModel?> getAllCafeteria() {
    return _$getAllCafeteriaAsyncAction.run(() => super.getAllCafeteria());
  }

  final _$getPdfShowAsyncAction =
      AsyncAction('_AdminCafeteriaGetAllViewModelBase.getPdfShow');

  @override
  Future<dynamic> getPdfShow(String fileName) {
    return _$getPdfShowAsyncAction.run(() => super.getPdfShow(fileName));
  }

  final _$getByIdUserAsyncAction =
      AsyncAction('_AdminCafeteriaGetAllViewModelBase.getByIdUser');

  @override
  Future<UserGetByIdModel?> getByIdUser(int? id) {
    return _$getByIdUserAsyncAction.run(() => super.getByIdUser(id));
  }

  final _$deleteCafeteriaAsyncAction =
      AsyncAction('_AdminCafeteriaGetAllViewModelBase.deleteCafeteria');

  @override
  Future<BaseResponseModel?> deleteCafeteria(int id) {
    return _$deleteCafeteriaAsyncAction.run(() => super.deleteCafeteria(id));
  }

  final _$_AdminCafeteriaGetAllViewModelBaseActionController =
      ActionController(name: '_AdminCafeteriaGetAllViewModelBase');

  @override
  String dateFormat(DateTime tm) {
    final _$actionInfo = _$_AdminCafeteriaGetAllViewModelBaseActionController
        .startAction(name: '_AdminCafeteriaGetAllViewModelBase.dateFormat');
    try {
      return super.dateFormat(tm);
    } finally {
      _$_AdminCafeteriaGetAllViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
file: ${file},
dio: ${dio},
cafeteriaService: ${cafeteriaService},
getAllResponse: ${getAllResponse},
deleteResponse: ${deleteResponse},
userGetByIdModel: ${userGetByIdModel}
    ''';
  }
}
