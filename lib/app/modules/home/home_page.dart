import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/modules/home/home_controller.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/google_login_icon.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/list_object.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu),
              title: Text(
                'Ghi chú',
              ),
              centerTitle: true,
              backgroundColor: colorPrimary,
              actions: [
                GoogleLoginIcon(
                  onTap: () {},
                )
              ],
            ),
            body: SafeArea(child: ListObject()),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              backgroundColor: colorPrimary,
              children: [
                SpeedDialChild(
                    backgroundColor: colorPrimary,
                    child: Icon(
                      Icons.add_alert,
                    ),
                    label: 'Thêm ghi chú',
                    onTap: () async {
                      await _.addNote();
                    }),
                SpeedDialChild(
                  backgroundColor: colorPrimary,
                  child: Icon(
                    Icons.add_a_photo,
                  ),
                  label: 'Thêm ảnh',
                  onTap: () async {
                    await _.getImage();
                  },
                ),
              ],
            ));
      },
    );
  }
}
