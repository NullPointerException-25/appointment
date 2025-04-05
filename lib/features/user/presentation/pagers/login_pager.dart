import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/presentation/controllers/login_controller.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginPager extends GetView<LoginController> {
  const LoginPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingM,
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(Translator.login.tr,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: SetupController.to.emailFormKey,
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
                        onChanged: (value) =>
                        controller.email.value = value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            HugeIcons.strokeRoundedMail01,
                            color:
                            Theme.of(context).brightness == Brightness.light
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
                              fontSize: 16, color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
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
                            color:
                            Theme.of(context).brightness == Brightness.light
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
                              fontSize: 16, color: Theme.of(context).hintColor),
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

              const SizedBox(height: 20),
          ObxValue<RxList<UserEntity>>(
              (accounts) {
                if (accounts.isEmpty) {
                  return const SizedBox();
                }
                return Text(Translator.savedAccounts.tr,
                    style: Theme.of(context).textTheme.titleMedium);
              }, controller.accounts
            ),
              Padding(
                padding: const EdgeInsets.all(kPaddingL),
                child: ObxValue<RxList<UserEntity>>(
                  (accounts) =>  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        final account = accounts[index];
                        return InkWell(
                          onTap: () {
                            controller.localLogin(account);
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: kPaddingXS),
                            child: Column(
                              spacing: kSpacing,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                account.localImage.value==null? const Icon(HugeIcons.strokeRoundedUser): CircleAvatar(
                                  backgroundImage: FileImage(account.localImage.value!),
                                  radius: kIconSizeM/2,
                                ),
                                Text(account.name),
                                Text(account.email),
                              ],
                            ),
                          ),
                        );
                      },),
                  ), controller.accounts
                ),
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
                    if (controller.loginFormKey.currentState!
                        .validate()) {
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
                  child: Text(Translator.continueWithoutAccount.tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}