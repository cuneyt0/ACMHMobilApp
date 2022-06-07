// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_cafeteria_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminCafeteriaAddViewModel on _AdminCafeteriaAddViewModelBase, Store {
  final _$cafeteriaServiceAtom =
      Atom(name: '_AdminCafeteriaAddViewModelBase.cafeteriaService');

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

  final _$fmcServiceAtom =
      Atom(name: '_AdminCafeteriaAddViewModelBase.fmcService');

  @override
  IFCMService get fmcService {
    _$fmcServiceAtom.reportRead();
    return super.fmcService;
  }

  @override
  set fmcService(IFCMService value) {
    _$fmcServiceAtom.reportWrite(value, super.fmcService, () {
      super.fmcService = value;
    });
  }

  final _$titleControllerAtom =
      Atom(name: '_AdminCafeteriaAddViewModelBase.titleController');

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

  final _$isLoadingAtom =
      Atom(name: '_AdminCafeteriaAddViewModelBase.isLoading');

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
      Atom(name: '_AdminCafeteriaAddViewModelBase.newFilePath');

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

  final _$userIdAtom = Atom(name: '_AdminCafeteriaAddViewModelBase.userId');

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

  final _$resultAtom = Atom(name: '_AdminCafeteriaAddViewModelBase.result');

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

  final _$fileAtom = Atom(name: '_AdminCafeteriaAddViewModelBase.file');

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

  final _$newFileAtom = Atom(name: '_AdminCafeteriaAddViewModelBase.newFile');

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
      Atom(name: '_AdminCafeteriaAddViewModelBase.appStorage');

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

  final _$notificationAtom =
      Atom(name: '_AdminCafeteriaAddViewModelBase.notification');

  @override
  FirebaseMessageNotificationModel? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(FirebaseMessageNotificationModel? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_AdminCafeteriaAddViewModelBase.formKey');

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

  final _$uploadPdfAsyncAction =
      AsyncAction('_AdminCafeteriaAddViewModelBase.uploadPdf');

  @override
  Future<void> uploadPdf() {
    return _$uploadPdfAsyncAction.run(() => super.uploadPdf());
  }

  final _$saveFilePermanentlyAsyncAction =
      AsyncAction('_AdminCafeteriaAddViewModelBase.saveFilePermanently');

  @override
  Future<File> saveFilePermanently(dynamic file) {
    return _$saveFilePermanentlyAsyncAction
        .run(() => super.saveFilePermanently(file));
  }

  final _$postActivityAsyncAction =
      AsyncAction('_AdminCafeteriaAddViewModelBase.postActivity');

  @override
  Future<void> postActivity() {
    return _$postActivityAsyncAction.run(() => super.postActivity());
  }

  final _$sendNotificationMessageAsyncAction =
      AsyncAction('_AdminCafeteriaAddViewModelBase.sendNotificationMessage');

  @override
  Future<void> sendNotificationMessage() {
    return _$sendNotificationMessageAsyncAction
        .run(() => super.sendNotificationMessage());
  }

  final _$_AdminCafeteriaAddViewModelBaseActionController =
      ActionController(name: '_AdminCafeteriaAddViewModelBase');

  @override
  String? noticeStringValidation(String? value) {
    final _$actionInfo =
        _$_AdminCafeteriaAddViewModelBaseActionController.startAction(
            name: '_AdminCafeteriaAddViewModelBase.noticeStringValidation');
    try {
      return super.noticeStringValidation(value);
    } finally {
      _$_AdminCafeteriaAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingView() {
    final _$actionInfo = _$_AdminCafeteriaAddViewModelBaseActionController
        .startAction(name: '_AdminCafeteriaAddViewModelBase.changeLoadingView');
    try {
      return super.changeLoadingView();
    } finally {
      _$_AdminCafeteriaAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cafeteriaService: ${cafeteriaService},
fmcService: ${fmcService},
titleController: ${titleController},
isLoading: ${isLoading},
newFilePath: ${newFilePath},
userId: ${userId},
result: ${result},
file: ${file},
newFile: ${newFile},
appStorage: ${appStorage},
notification: ${notification},
formKey: ${formKey}
    ''';
  }
}
