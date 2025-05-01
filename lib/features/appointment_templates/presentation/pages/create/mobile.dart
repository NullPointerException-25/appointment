import 'package:appointments_manager/features/appointment_templates/presentation/controllers/create_template_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';
import '../../widgets/appbar.dart';

class MobileCreateTemplatePage extends GetView<CreateTemplateController> {
   MobileCreateTemplatePage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        child: CustomScrollView(
          slivers: [
            const TemplatesAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        HugeIcons.strokeRoundedAdd01, color: ThemeColors.white,),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
