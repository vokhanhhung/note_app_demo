import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/models/image_model.dart';
import 'package:getx_pattern_project/app/modules/home/home_controller.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/background_remove_image.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/background_remove_note.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/change_note_dialog.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/delete_item_alert.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/notification_empty_note.dart';
import 'package:getx_pattern_project/app/theme/text_theme.dart';

class ListObject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (_) {
      if (_.isEmptyList) {
        return NotificationEmptyNote();
      } else
        return ListView.builder(
          itemCount: _.mixList.length,
          itemBuilder: (context, index) {
            final item = _.mixList[index];
            if (item is ImageModel) {
              final imageIndex = index - _.notes.length;
              return Dismissible(
                background: BackGroundRemoveImage(),
                key: UniqueKey(),
                confirmDismiss: (direction) async {
                  return await Get.dialog(DeleteItemAlert(),
                      barrierDismissible: false);
                },
                onDismissed: (direction) {
                  _.images.removeAt(imageIndex);
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.file(
                          File(item.path),
                          width: MediaQuery.of(context).size.width - 10,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${item.dateTime}',
                            style: textStyle12,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' ${item.content}',
                              style: textStyle20b,
                            ),
                            ChangeNoteDialog(
                              itemChange: item.content,
                              onSubmitted: (value) {
                                item.content = value;
                                _.images[imageIndex] = item;
                                _.mixList[imageIndex] = item;
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Dismissible(
                background: BackGroundRemoveNote(),
                key: UniqueKey(),
                confirmDismiss: (direction) async {
                  return await Get.dialog(DeleteItemAlert(),
                      barrierDismissible: false);
                },
                onDismissed: (direction) {
                  _.notes.removeAt(index);
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.content}',
                          style: item.isComplete
                              ? textStyleCompleteNote
                              : textStyle20b,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${item.dateTime}',
                          style: textStyle12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(
                              onChanged: (value) {
                                item.isComplete = value;
                                _.notes[index] = item;
                                _.mixList[index] = item;
                              },
                              value: item.isComplete,
                            ),
                            ChangeNoteDialog(
                              itemChange: item.content,
                              onSubmitted: (value) {
                                item.content = value;
                                _.notes[index] = item;
                                _.mixList[index] = item;
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
    });
  }
}
