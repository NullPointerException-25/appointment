import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/presentation/controllers/login_controller.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/account_list_item.dart';

class LoginPager extends GetView<LoginController> {
  const LoginPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              ResponsiveLayout(
                desktop: SliverToBoxAdapter(
                  child: Obx(
                    () => SizedBox(
                      height: controller.accounts.length < 2
                          ? MediaQuery.of(context).size.height * 0.2
                          : 0,
                    ),
                  ),
                ),
                mobile: const SliverToBoxAdapter(),
                tablet: Obx(
                  () =>  SliverToBoxAdapter(
                    child: SizedBox(
                      height: controller.accounts.length < 2
                          ? MediaQuery.of(context).size.height * 0.2
                          : MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPadding(
                padding: const EdgeInsets.all(kPadding),
                sliver: SliverToBoxAdapter(
                  child: Text(Translator.login.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Translator.pleaseEnterSomeText.tr;
                            }
                            if (!GetUtils.isEmail(value.trim())) {
                              return Translator.pleaseEnterAValidEmail.tr;
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 16),
                          onChanged: (value) => controller.email.value = value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              HugeIcons.strokeRoundedMail01,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColorLight,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: Translator.email.tr,
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Translator.pleaseEnterSomeText.tr;
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 16),
                          onChanged: (value) =>
                              controller.password.value = value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              HugeIcons.strokeRoundedLockPassword,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColorLight,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: Translator.password.tr,
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: kSpacing)),
              SliverPadding(
                padding: const EdgeInsets.all(kPadding),
                sliver: SliverToBoxAdapter(
                  child: InkWell(
                    onTap: () {},
                    child: Text.rich(TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 14),
                        text: Translator.bySigningIn.tr,
                        children: [
                          TextSpan(
                              text: Translator.termsOfService.tr,
                              style:
                                  const TextStyle(color: ThemeColors.lightBlue))
                        ])),
                  ),
                ),
              ),
              ObxValue<RxList<UserEntity>>((accounts) {
                if (accounts.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: SizedBox(),
                  );
                }
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: kPadding, left: kPadding, right: kPadding),
                    child: Text(Translator.savedAccounts.tr,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                );
              }, controller.accounts),
              SliverPadding(
                padding: const EdgeInsets.all(kPaddingL),
                sliver: ObxValue<RxList<UserEntity>>(
                    (accounts) => SliverList.builder(
                          itemCount: accounts.length,
                          itemBuilder: (context, index) {
                            final account = accounts[index];
                            return AccountListItem(account);
                          },
                        ),
                    controller.accounts),
              )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle:
                        const TextStyle(fontSize: 16, color: ThemeColors.white),
                  ),
                  onPressed: () async {
                    if (controller.loginFormKey.currentState!.validate()) {
                      controller.login();
                    }
                  },
                  child: Text(Translator.login.tr),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    SetupController.to.nextStep();
                  },
                  child: Text(Translator.newProfile.tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
