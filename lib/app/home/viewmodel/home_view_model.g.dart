// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$dioAtom = Atom(name: '_HomeViewModelBase.dio');

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

  final _$responseDataAtom = Atom(name: '_HomeViewModelBase.responseData');

  @override
  NoticeGetAllResponseModel? get responseData {
    _$responseDataAtom.reportRead();
    return super.responseData;
  }

  @override
  set responseData(NoticeGetAllResponseModel? value) {
    _$responseDataAtom.reportWrite(value, super.responseData, () {
      super.responseData = value;
    });
  }

  final _$deleteResponseDataAtom =
      Atom(name: '_HomeViewModelBase.deleteResponseData');

  @override
  NoticeDeleteResponseModel? get deleteResponseData {
    _$deleteResponseDataAtom.reportRead();
    return super.deleteResponseData;
  }

  @override
  set deleteResponseData(NoticeDeleteResponseModel? value) {
    _$deleteResponseDataAtom.reportWrite(value, super.deleteResponseData, () {
      super.deleteResponseData = value;
    });
  }

  final _$photoAtom = Atom(name: '_HomeViewModelBase.photo');

  @override
  dynamic get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(dynamic value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  final _$pdfAtom = Atom(name: '_HomeViewModelBase.pdf');

  @override
  dynamic get pdf {
    _$pdfAtom.reportRead();
    return super.pdf;
  }

  @override
  set pdf(dynamic value) {
    _$pdfAtom.reportWrite(value, super.pdf, () {
      super.pdf = value;
    });
  }

  final _$dataAtom = Atom(name: '_HomeViewModelBase.data');

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

  final _$getAllNoticeAsyncAction =
      AsyncAction('_HomeViewModelBase.getAllNotice');

  @override
  Future<void> getAllNotice() {
    return _$getAllNoticeAsyncAction.run(() => super.getAllNotice());
  }

  final _$getImageAsyncAction = AsyncAction('_HomeViewModelBase.getImage');

  @override
  Future<dynamic> getImage(String fileName) {
    return _$getImageAsyncAction.run(() => super.getImage(fileName));
  }

  final _$showPreviewAsyncAction =
      AsyncAction('_HomeViewModelBase.showPreview');

  @override
  Future<OpenResult> showPreview(
      {required Uint8List data,
      required String? type,
      required String? fileName}) {
    return _$showPreviewAsyncAction.run(
        () => super.showPreview(data: data, type: type, fileName: fileName));
  }

  final _$getPdfShowAsyncAction = AsyncAction('_HomeViewModelBase.getPdfShow');

  @override
  Future<dynamic> getPdfShow(String fileName) {
    return _$getPdfShowAsyncAction.run(() => super.getPdfShow(fileName));
  }

  final _$deleteAsyncAction = AsyncAction('_HomeViewModelBase.delete');

  @override
  Future<dynamic> delete(int? id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
dio: ${dio},
responseData: ${responseData},
deleteResponseData: ${deleteResponseData},
photo: ${photo},
pdf: ${pdf},
data: ${data}
    ''';
  }
}
