

import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hugeicons/hugeicons.dart';

class SelectAppointmentBottomSheet extends GetView<CreateAppointmentController> {
  const SelectAppointmentBottomSheet(
    this._templates, {
    super.key,
  });

  final RxList<AppointmentTemplateEntity> _templates;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(kCornerRadiusM)),
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 50,
              margin: EdgeInsets.symmetric(vertical: kPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(kCornerRadiusM),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(bottom: kPadding),
              child: Text(
                "Your templates",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
                child: Obx(
                    () => ListView.builder(
                                itemBuilder: (context, index) => ListTile(
                  onTap: (){
                     controller.loadFields(_templates[index]);
                     Get.back();
                  },
                  tileColor: ThemeColors.darkGrey,
                  selectedTileColor: ThemeColors.darkGrey,
                  trailing: IconButton(
                    onPressed: (){
                      controller.deleteTemplate(_templates[index]);
                    },
                    icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedDelete01,
                        color: Theme.of(context).brightness == Brightness.light
                            ? ThemeColors.black
                            : ThemeColors.white),
                  ),
                  title: Text(
                    _templates[index].name,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? ThemeColors.black
                            : ThemeColors.white),
                  ),
                                ),
                                itemCount: _templates.length,
                              ),
                )),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      }, child: Text("Continue without template")),
                )),
              ],
            )
          ],
        ));
  }
}
