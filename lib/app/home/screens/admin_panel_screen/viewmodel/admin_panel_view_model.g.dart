// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_panel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminPanelViewModel on _AdminPanelViewModelBase, Store {
  final _$serviceAtom = Atom(name: '_AdminPanelViewModelBase.service');

  @override
  IAdminPanelService get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(IAdminPanelService value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  final _$userGetAllResponseAtom =
      Atom(name: '_AdminPanelViewModelBase.userGetAllResponse');

  @override
  UserGetAllResponse? get userGetAllResponse {
    _$userGetAllResponseAtom.reportRead();
    return super.userGetAllResponse;
  }

  @override
  set userGetAllResponse(UserGetAllResponse? value) {
    _$userGetAllResponseAtom.reportWrite(value, super.userGetAllResponse, () {
      super.userGetAllResponse = value;
    });
  }

  final _$userComputerResponseAtom =
      Atom(name: '_AdminPanelViewModelBase.userComputerResponse');

  @override
  UserGetAllResponse? get userComputerResponse {
    _$userComputerResponseAtom.reportRead();
    return super.userComputerResponse;
  }

  @override
  set userComputerResponse(UserGetAllResponse? value) {
    _$userComputerResponseAtom.reportWrite(value, super.userComputerResponse,
        () {
      super.userComputerResponse = value;
    });
  }

  final _$userMachineResponseAtom =
      Atom(name: '_AdminPanelViewModelBase.userMachineResponse');

  @override
  UserGetAllResponse? get userMachineResponse {
    _$userMachineResponseAtom.reportRead();
    return super.userMachineResponse;
  }

  @override
  set userMachineResponse(UserGetAllResponse? value) {
    _$userMachineResponseAtom.reportWrite(value, super.userMachineResponse, () {
      super.userMachineResponse = value;
    });
  }

  @override
  String toString() {
    return '''
service: ${service},
userGetAllResponse: ${userGetAllResponse},
userComputerResponse: ${userComputerResponse},
userMachineResponse: ${userMachineResponse}
    ''';
  }
}
