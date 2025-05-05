import 'package:appointments_manager/features/appointment_templates/presentation/controllers/create_template_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';
import '../../../../../core/widgets/text_form_field_core.dart';
import '../../../../appointment/presentation/widgets/duration_slider.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_field_editing.dart';

class MobileCreateTemplatePage extends GetView<CreateTemplateController> {
  MobileCreateTemplatePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            const TemplatesAppBar(),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: kSpacing,
                children: [
                  Text(
                    Translator.templateName.tr,
                    style: const TextStyle(
                      fontSize: kFontSizeM,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  TextFormFieldCore(
                    hintText: Translator.exampleTemplateName.tr,
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
                child:
                       Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Translator.defaultDuration.tr
                          ),
                        ],
                      ),
                    ),
            ),
            const SliverToBoxAdapter(
              child: DurationSlider<CreateTemplateController>(),
            ),
            SliverToBoxAdapter(
                child: ObxValue<RxString>(
                    (value) => Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                                value.value,
                              ),
                        ],
                      ),
                    ),
                    controller.selectedDurationString)),
            Obx(
                  () => SliverPadding(
                padding: const EdgeInsets.all(kPaddingM),
                sliver: SliverList.builder(
                    itemCount: controller.fields.length+1,
                    itemBuilder: (context, index) {
                      if (index == controller.fields.length) {
                        return Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Row(
                            children: [
                              ElevatedButton.icon(
                                icon: const Icon(HugeIcons.strokeRoundedAdd01, color: ThemeColors.white,),
                                onPressed: () {
                                  controller.addField();
                                },
                                label: Text(
                                  Translator.addNewField.tr,
                                  style: const TextStyle(
                                      color: ThemeColors.white,
                                      fontSize: kFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return CustomFieldEditing(field: controller.fields[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
