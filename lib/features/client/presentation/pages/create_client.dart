import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/client/presentation/widgets/create_client_form.dart';
import 'package:appointments_manager/features/client/presentation/widgets/create_client_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hugeicons/hugeicons.dart';

class CreateClientPage extends StatelessWidget {
  const CreateClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'Create Client',
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ThemeColors.white
                              : ThemeColors.dark),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          HugeIcons.strokeRoundedHelpCircle,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ThemeColors.white
                              : ThemeColors.dark,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: kPaddingM, left: kPaddingM, right: kPaddingM),
                        child: CreateClientPreviewCard(),
                      ),
                  ),
                   SliverPadding(
                    padding:  const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: CreateClientForm()
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: ElevatedButton(onPressed: (){}, child: Center(child: Text(Translator.save.tr))),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
