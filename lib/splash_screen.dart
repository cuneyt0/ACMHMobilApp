import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_work/core/cache_manager.dart';
import 'package:login_work/login/model/login_response.dart';
import 'package:login_work/login/view/login_detail_view.dart';
import 'dart:async';

import 'login/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CacheManager cacheManager = CacheManager();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      cacheManager.getLoginResponse().then((loginRes) {
        if (loginRes == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginDetailView(
                model: LoginResponseModel.fromJson(jsonDecode(loginRes)),
                cacheManager: cacheManager,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/logo/neu_logo.jpg"),
          maxRadius: 120,
          minRadius: 50,
        ),
      ),
    );
  }
}
