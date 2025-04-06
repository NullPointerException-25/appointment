import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/global_values.dart';

class AccountListItem extends GetView<LoginController> {
  const AccountListItem(this.account, {super.key});
  final UserEntity account;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.localLogin(account);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingM),
        child: Row(
          spacing: kSpacing,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            account.localImage.value == null
                ? const Icon(HugeIcons.strokeRoundedUser)
                : CircleAvatar(
                    backgroundImage: FileImage(account.localImage.value!),
                    radius: kIconSizeL / 2,
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(account.name),
                Text(
                  account.email.isEmpty ? "No email linked" : account.email,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              account.email.isNotEmpty
                  ? HugeIcons.strokeRoundedCloudSavingDone01
                  : Icons.cloud_off,
              size: kIconSize,
            )
          ],
        ),
      ),
    );
  }
}
