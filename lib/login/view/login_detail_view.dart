import 'package:flutter/material.dart';
import 'package:login_work/core/cache_manager.dart';
import 'package:login_work/login/model/login_response.dart';

class LoginDetialView extends StatelessWidget with CacheManager {
  final LoginResponseModel? model;

  const LoginDetialView({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                model?.user == null;
                Navigator.pop(context);
              },
              child: Text("Cıkıs yap"))
        ],
      ),
    );
  }
}
