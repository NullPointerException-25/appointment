import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class CreateClientPreviewCard extends StatelessWidget {
  const CreateClientPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCornerRadiusM),
      child: AnimatedMeshGradient(
        colors: [
          ThemeColors.lightBlue,
          ThemeColors.lightBlue,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
        ],
        options: AnimatedMeshGradientOptions(),
        child: Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.all(kPaddingM),
        ),
      ),
    );
  }
}
