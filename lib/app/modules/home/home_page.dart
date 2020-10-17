import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/modules/home/home_controller.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/list_object.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/notification_empty_note.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Obx(
          () => SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.menu),
                  title: Text(
                    'Ghi chú',
                  ),
                  centerTitle: true,
                  backgroundColor: colorPrimary,
                  actions: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.center,
                        child: Text(
                          'G',
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                      ),
                    ),
                  ],
                ),
                body: _.images.isEmpty && _.notes.isEmpty
                    ? NotificationEmptyNote()
                    : Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ListObject(),
                      ),
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
                )),
          ),
        );
      },
    );
  }
}
