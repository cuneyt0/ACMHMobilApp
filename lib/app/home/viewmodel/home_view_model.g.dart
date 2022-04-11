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

  final _$deleteAsyncAction = AsyncAction('_HomeViewModelBase.delete');

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  @override
  String toString() {
    return '''
dio: ${dio},
responseData: ${responseData}
    ''';
  }
}
