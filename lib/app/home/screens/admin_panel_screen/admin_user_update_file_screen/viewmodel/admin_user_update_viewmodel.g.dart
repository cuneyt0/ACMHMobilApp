// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_update_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminUserUpdateViewModel on _AdminUserUpdateViewModelBase, Store {
  final _$cafeteriaServiceAtom =
      Atom(name: '_AdminUserUpdateViewModelBase.cafeteriaService');

  @override
  IAdminUserService get cafeteriaService {
    _$cafeteriaServiceAtom.reportRead();
    return super.cafeteriaService;
  }

  @override
  set cafeteriaService(IAdminUserService value) {
    _$cafeteriaServiceAtom.reportWrite(value, super.cafeteriaService, () {
      super.cafeteriaService = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AdminUserUpdateViewModelBase.isLoading');

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

  final _$newFilePathAtom =
      Atom(name: '_AdminUserUpdateViewModelBase.newFilePath');

  @override
  String? get newFilePath {
    _$newFilePathAtom.reportRead();
    return super.newFilePath;
  }

  @override
  set newFilePath(String? value) {
    _$newFilePathAtom.reportWrite(value, super.newFilePath, () {
      super.newFilePath = value;
    });
  }

  final _$userIdAtom = Atom(name: '_AdminUserUpdateViewModelBase.userId');

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$resultAtom = Atom(name: '_AdminUserUpdateViewModelBase.result');

  @override
  FilePickerResult? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(FilePickerResult? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$fileAtom = Atom(name: '_AdminUserUpdateViewModelBase.file');

  @override
  PlatformFile? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(PlatformFile? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$newFileAtom = Atom(name: '_AdminUserUpdateViewModelBase.newFile');

  @override
  File? get newFile {
    _$newFileAtom.reportRead();
    return super.newFile;
  }

  @override
  set newFile(File? value) {
    _$newFileAtom.reportWrite(value, super.newFile, () {
      super.newFile = value;
    });
  }

  final _$appStorageAtom =
      Atom(name: '_AdminUserUpdateViewModelBase.appStorage');

  @override
  Directory? get appStorage {
    _$appStorageAtom.reportRead();
    return super.appStorage;
  }

  @override
  set appStorage(Directory? value) {
    _$appStorageAtom.reportWrite(value, super.appStorage, () {
      super.appStorage = value;
    });
  }

  final _$uploadPdfAsyncAction =
      AsyncAction('_AdminUserUpdateViewModelBase.uploadPdf');

  @override
  Future<void> uploadPdf() {
    return _$uploadPdfAsyncAction.run(() => super.uploadPdf());
  }

  final _$saveFilePermanentlyAsyncAction =
      AsyncAction('_AdminUserUpdateViewModelBase.saveFilePermanently');

  @override
  Future<File> saveFilePermanently(dynamic file) {
    return _$saveFilePermanentlyAsyncAction
        .run(() => super.saveFilePermanently(file));
  }

  final _$postExcelAsyncAction =
      AsyncAction('_AdminUserUpdateViewModelBase.postExcel');

  @override
  Future<void> postExcel() {
    return _$postExcelAsyncAction.run(() => super.postExcel());
  }

  @override
  String toString() {
    return '''
cafeteriaService: ${cafeteriaService},
isLoading: ${isLoading},
newFilePath: ${newFilePath},
userId: ${userId},
result: ${result},
file: ${file},
newFile: ${newFile},
appStorage: ${appStorage}
    ''';
  }
}
