import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/modules/login/login_controller.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Đăng nhập'),
            centerTitle: true,
            backgroundColor: colorPrimary,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                obscureText: true,
                autofocus: true,
                onSubmitted: _.signIn,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu của bạn là: ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          )),
    );
  }
}
