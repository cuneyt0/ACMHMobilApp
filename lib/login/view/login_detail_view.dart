import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:login_work/core/cache_manager.dart';
import 'package:login_work/login/model/login_response.dart';

import 'login_view.dart';

class LoginDetailView extends StatelessWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;

  const LoginDetailView(
      {Key? key, required this.model, this.cacheManager, this.isClear})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(model?.token ?? ''),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(model?.user!.firstName ?? ""),
          ),
          Center(
            child: model?.user!.departmentId == 2
                ? Text("Bilgisayar Muhendisligi")
                : Text("Makine Mühendisligi"),
          ),
          ElevatedButton(
              onPressed: () {
                model?.user = null;
                isClear != isClear;
                model?.token = null;
                model?.expiration = 0;
                if (model!.user == null) {
                  print("model null");
                  cacheManager?.removeAllData();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginView()),
                      (Route<dynamic> route) => false);
                } else {
                  exit(0);
                }
              },
              child: Text("Cıkıs yap"))
        ],
      ),
    );
  }
}

/*
*
*
* */