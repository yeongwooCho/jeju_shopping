import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.barrier,
      body: Center(
        child: Center(
          child: Image.asset('asset/img/logo/logo.png',
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
