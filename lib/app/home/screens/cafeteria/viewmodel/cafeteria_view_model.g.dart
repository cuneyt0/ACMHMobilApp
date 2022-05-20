// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafeteria_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CafeteriaViewModel on _CafeteriaViewModelBase, Store {
  final _$serviceAtom = Atom(name: '_CafeteriaViewModelBase.service');

  @override
  IPublicCafeteriaService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IPublicCafeteriaService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$responseModelAtom =
      Atom(name: '_CafeteriaViewModelBase.responseModel');

  @override
  NoticeGetAllResponseModel? get responseModel {
    _$responseModelAtom.reportRead();
    return super.responseModel;
  }

  @override
  set responseModel(NoticeGetAllResponseModel? value) {
    _$responseModelAtom.reportWrite(value, super.responseModel, () {
      super.responseModel = value;
    });
  }

  final _$getCafeteriRecentlyAsyncAction =
      AsyncAction('_CafeteriaViewModelBase.getCafeteriRecently');

  @override
  Future<NoticeGetAllResponseModel?> getCafeteriRecently() {
    return _$getCafeteriRecentlyAsyncAction
        .run(() => super.getCafeteriRecently());
  }

  @override
  String toString() {
    return '''
service: ${service},
responseModel: ${responseModel}
    ''';
  }
}
