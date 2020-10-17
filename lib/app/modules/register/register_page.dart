import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/modules/register/register_controller.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Đăng kí mật khẩu'),
            centerTitle: true,
            backgroundColor: colorPrimary,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                obscureText: true,
                onSubmitted: _.register,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Mật khẩu của bạn là: ',
                    border: OutlineInputBorder()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
