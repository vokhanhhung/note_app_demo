import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/models/image_model.dart';
import 'package:getx_pattern_project/app/modules/home/home_controller.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/background_remove_image.dart';
import 'package:getx_pattern_project/app/modules/home/local_widets/background_remove_note.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';
import 'package:getx_pattern_project/app/theme/text_theme.dart';

class ListObject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Obx(
        () => ListView.builder(
          itemCount: _.mixList.length,
          itemBuilder: (context, index) {
            final item = _.mixList[index];
            if (item is ImageModel) {
              return FractionallySizedBox(
                widthFactor: 0.95,
                child: Card(
                  color: colorCard,
                  child: Dismissible(
                    background: BackGroundRemoveImage(),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      _.images.removeAt(index - _.notes.length);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Spacer(),
                          Image.file(
                            File(item.path),
                            width: MediaQuery.of(context).size.width - 10,
                            height: MediaQuery.of(context).size.height * 0.6,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
                          Text(
                            '${item.content}',
                            style: textStyle20b,
                          ),
                          Spacer(),
                          Text(
                            '${item.dateTime}',
                            style: textStyle12,
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return FractionallySizedBox(
                widthFactor: 0.95,
                child: Card(
                  color: colorCard,
                  child: Dismissible(
                    background: BackGroundRemoveNote(),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      _.notes.removeAt(index);
                    },
                    child: Wrap(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${item.content}',
                            style: item.isComplete
                                ? textStyleCompleteNote
                                : textStyle20b,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${item.dateTime}',
                            style: textStyle12,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Checkbox(
                            onChanged: (value) {
                              item.isComplete = value;
                              _.notes[index] = item;
                              _.mixList[index] = item;
                            },
                            value: item.isComplete,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );
    });
  }
}
