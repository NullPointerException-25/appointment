import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SelectAppointmentBottomSheet
    extends GetView<CreateAppointmentController> {
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
              margin: const EdgeInsets.symmetric(vertical: kPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(kCornerRadiusM),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: kPadding),
              child: Text(
                "Your templates",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => Padding(
                padding:  const EdgeInsets.symmetric(horizontal: kPadding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).size.width/150).toInt(), childAspectRatio: 1),
                  itemBuilder: (context, index) => InkWell(
                    onLongPress: (){
                      controller.deleteTemplate(_templates[index]);
                    },
                    onTap: () {
                      controller.loadFields(_templates[index]);
                      Get.back();
                    },
                    child: Card(
                      shape: const  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kCornerRadius))),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.darkGrey
                          : ThemeColors.whiteDarker,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _templates[index].name,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? ThemeColors.black
                                    : ThemeColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: _templates.length,
                ),
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
                      },
                      child: const Text("Continue without template")),
                )),
              ],
            )
          ],
        ));
  }
}
