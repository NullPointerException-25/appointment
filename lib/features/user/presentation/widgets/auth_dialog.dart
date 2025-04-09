import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';

class AuthDialog extends StatelessWidget {
  AuthDialog({super.key, required this.email});

  final passwordController = TextEditingController();
  final String email;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(kPaddingXL),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCornerRadius),
      ),
      content: Column(
        spacing: kSpacingL,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Authentication Required for $email',
            style: Theme.of(context).textTheme.titleMedium,
            softWrap: true,
          ),
           TextFormFieldCore(
            controller: passwordController,
            hintText: "Introduce password",
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Authenticate'),
          ),
        ],
      ),
    );
  }
}
