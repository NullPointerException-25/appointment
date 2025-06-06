
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/custom_field_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/utils/global_values.dart';
import '../../../../presentation/widgets/duration_slider.dart';
import '../../controllers/create_template_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_field_editing.dart';
import '../../widgets/templates_dialog.dart';

class MobileCreateTemplatePage extends GetView<CreateTemplateController> {
  MobileCreateTemplatePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const TemplatesAppBar(),
                  SliverToBoxAdapter(
                    child: TemplatesDialog()
                  ),
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
                          controller: TextEditingController(text: controller.templateName.value),
                          onChanged: (value) {
                            controller.templateName.value = value;
                          },
                          maxLength: 30,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Translator.pleaseEnterSomeText.tr;
                            }
                            return null;
                          },
                          hintText: Translator.exampleTemplateName.tr,
                        ),
                      ],
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Obx(() => Row(
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            kCornerRadiusXS)),
                                    side: const BorderSide(
                                        color: ThemeColors.darkBlue),
                                    checkColor: ThemeColors.white,
                                    value:
                                        controller.durationSliderEnabled.value,
                                    onChanged: (value) {
                                      controller.durationSliderEnabled.value =
                                          value!;
                                    }),
                                Text(Translator.useDefaultDuration.tr),
                              ],
                            ))),
                  ),
                  Obx(() {
                    return SliverToBoxAdapter(
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: controller.durationSliderEnabled.value
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(kPadding),
                                    child: Text(
                                      Translator.defaultDuration.tr,
                                      style: const TextStyle(
                                          fontSize: kFontSizeM,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(kPadding),
                                    child: DurationSlider<
                                        CreateTemplateController>(),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  Padding(
                                    padding: const EdgeInsets.all(kPadding),
                                    child: Text(
                                      controller.selectedDurationString.value,
                                      style: const TextStyle(
                                        fontSize: kFontSizeM,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(width: 0, height: 0),
                      ),
                    );
                  }),
                  const SliverToBoxAdapter(
                      child: CustomFieldDialog()
                  ),
                  Obx(
                    () => SliverPadding(
                      padding: const EdgeInsets.all(kPaddingM),
                      sliver: SliverList.builder(
                          itemCount: controller.fields.length + 1,
                          itemBuilder: (context, index) {
                            if (index == controller.fields.length) {
                              return Padding(
                                padding: const EdgeInsets.all(kPadding),
                                child: Row(
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(
                                        HugeIcons.strokeRoundedAdd01,
                                        color: ThemeColors.white,
                                      ),
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
                            return CustomFieldEditing(
                                field: controller.fields[index]);
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kPaddingM),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            controller.createTemplate();
                          }

                        },
                        child: Text(
                          Translator.save.tr,
                          style: const TextStyle(
                              color: ThemeColors.white,
                              fontSize: kFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
