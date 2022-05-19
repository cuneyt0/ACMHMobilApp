// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_cafeteria_update_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateCafeteriaViewModel on _UpdateCafeteriaViewModelBase, Store {
  final _$titleControllerAtom =
      Atom(name: '_UpdateCafeteriaViewModelBase.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_UpdateCafeteriaViewModelBase.formKey');

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

  final _$isLoadingAtom = Atom(name: '_UpdateCafeteriaViewModelBase.isLoading');

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

  final _$idAtom = Atom(name: '_UpdateCafeteriaViewModelBase.id');

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

  final _$userIdAtom = Atom(name: '_UpdateCafeteriaViewModelBase.userId');

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

  final _$newFilePathAtom =
      Atom(name: '_UpdateCafeteriaViewModelBase.newFilePath');

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

  final _$appStorageAtom =
      Atom(name: '_UpdateCafeteriaViewModelBase.appStorage');

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

  final _$resultAtom = Atom(name: '_UpdateCafeteriaViewModelBase.result');

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

  final _$fileAtom = Atom(name: '_UpdateCafeteriaViewModelBase.file');

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

  final _$newFileAtom = Atom(name: '_UpdateCafeteriaViewModelBase.newFile');

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

  final _$adminPanelViewModelAtom =
      Atom(name: '_UpdateCafeteriaViewModelBase.adminPanelViewModel');

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

  final _$cafeteriaServiceAtom =
      Atom(name: '_UpdateCafeteriaViewModelBase.cafeteriaService');

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

  final _$uploadPdfAsyncAction =
      AsyncAction('_UpdateCafeteriaViewModelBase.uploadPdf');

  @override
  Future<void> uploadPdf() {
    return _$uploadPdfAsyncAction.run(() => super.uploadPdf());
  }

  final _$saveFilePermanentlyAsyncAction =
      AsyncAction('_UpdateCafeteriaViewModelBase.saveFilePermanently');

  @override
  Future<File> saveFilePermanently(dynamic file) {
    return _$saveFilePermanentlyAsyncAction
        .run(() => super.saveFilePermanently(file));
  }

  final _$updateActivityAsyncAction =
      AsyncAction('_UpdateCafeteriaViewModelBase.updateActivity');

  @override
  Future<void> updateActivity() {
    return _$updateActivityAsyncAction.run(() => super.updateActivity());
  }

  final _$_UpdateCafeteriaViewModelBaseActionController =
      ActionController(name: '_UpdateCafeteriaViewModelBase');

  @override
  void changeLoadingView() {
    final _$actionInfo = _$_UpdateCafeteriaViewModelBaseActionController
        .startAction(name: '_UpdateCafeteriaViewModelBase.changeLoadingView');
    try {
      return super.changeLoadingView();
    } finally {
      _$_UpdateCafeteriaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? noticeStringValidation(String? value) {
    final _$actionInfo =
        _$_UpdateCafeteriaViewModelBaseActionController.startAction(
            name: '_UpdateCafeteriaViewModelBase.noticeStringValidation');
    try {
      return super.noticeStringValidation(value);
    } finally {
      _$_UpdateCafeteriaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
formKey: ${formKey},
isLoading: ${isLoading},
id: ${id},
userId: ${userId},
newFilePath: ${newFilePath},
appStorage: ${appStorage},
result: ${result},
file: ${file},
newFile: ${newFile},
adminPanelViewModel: ${adminPanelViewModel},
cafeteriaService: ${cafeteriaService}
    ''';
  }
}
