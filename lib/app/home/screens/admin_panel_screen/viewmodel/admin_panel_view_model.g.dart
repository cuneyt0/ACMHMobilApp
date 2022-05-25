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

  final _$allStudentValueAtom =
      Atom(name: '_AdminPanelViewModelBase.allStudentValue');

  @override
  double get allStudentValue {
    _$allStudentValueAtom.reportRead();
    return super.allStudentValue;
  }

  @override
  set allStudentValue(double value) {
    _$allStudentValueAtom.reportWrite(value, super.allStudentValue, () {
      super.allStudentValue = value;
    });
  }

  final _$computerStudentValueAtom =
      Atom(name: '_AdminPanelViewModelBase.computerStudentValue');

  @override
  double get computerStudentValue {
    _$computerStudentValueAtom.reportRead();
    return super.computerStudentValue;
  }

  @override
  set computerStudentValue(double value) {
    _$computerStudentValueAtom.reportWrite(value, super.computerStudentValue,
        () {
      super.computerStudentValue = value;
    });
  }

  final _$machineStudentValueAtom =
      Atom(name: '_AdminPanelViewModelBase.machineStudentValue');

  @override
  double get machineStudentValue {
    _$machineStudentValueAtom.reportRead();
    return super.machineStudentValue;
  }

  @override
  set machineStudentValue(double value) {
    _$machineStudentValueAtom.reportWrite(value, super.machineStudentValue, () {
      super.machineStudentValue = value;
    });
  }

  final _$cafeteriaViewModelAtom =
      Atom(name: '_AdminPanelViewModelBase.cafeteriaViewModel');

  @override
  AdminCafeteriaGetAllViewModel get cafeteriaViewModel {
    _$cafeteriaViewModelAtom.reportRead();
    return super.cafeteriaViewModel;
  }

  @override
  set cafeteriaViewModel(AdminCafeteriaGetAllViewModel value) {
    _$cafeteriaViewModelAtom.reportWrite(value, super.cafeteriaViewModel, () {
      super.cafeteriaViewModel = value;
    });
  }

  final _$activityViewModelAtom =
      Atom(name: '_AdminPanelViewModelBase.activityViewModel');

  @override
  AdminActivityAllViewModel get activityViewModel {
    _$activityViewModelAtom.reportRead();
    return super.activityViewModel;
  }

  @override
  set activityViewModel(AdminActivityAllViewModel value) {
    _$activityViewModelAtom.reportWrite(value, super.activityViewModel, () {
      super.activityViewModel = value;
    });
  }

  final _$noticeViewModelAtom =
      Atom(name: '_AdminPanelViewModelBase.noticeViewModel');

  @override
  HomeViewModel get noticeViewModel {
    _$noticeViewModelAtom.reportRead();
    return super.noticeViewModel;
  }

  @override
  set noticeViewModel(HomeViewModel value) {
    _$noticeViewModelAtom.reportWrite(value, super.noticeViewModel, () {
      super.noticeViewModel = value;
    });
  }

  final _$colorListAtom = Atom(name: '_AdminPanelViewModelBase.colorList');

  @override
  List<Color> get colorList {
    _$colorListAtom.reportRead();
    return super.colorList;
  }

  @override
  set colorList(List<Color> value) {
    _$colorListAtom.reportWrite(value, super.colorList, () {
      super.colorList = value;
    });
  }

  @override
  String toString() {
    return '''
service: ${service},
userGetAllResponse: ${userGetAllResponse},
userComputerResponse: ${userComputerResponse},
userMachineResponse: ${userMachineResponse},
allStudentValue: ${allStudentValue},
computerStudentValue: ${computerStudentValue},
machineStudentValue: ${machineStudentValue},
cafeteriaViewModel: ${cafeteriaViewModel},
activityViewModel: ${activityViewModel},
noticeViewModel: ${noticeViewModel},
colorList: ${colorList}
    ''';
  }
}
