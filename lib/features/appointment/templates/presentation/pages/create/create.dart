import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/appointment/templates/presentation/pages/create/tablet.dart';
import 'package:flutter/material.dart';

import 'desktop.dart';
import 'mobile.dart';

class CreateTemplatesPage extends StatelessWidget {
  const CreateTemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobile: MobileCreateTemplatePage(),
        tablet: const TabletCreateTemplatePage(),
        desktop: const DesktopCreateTemplatePage());
  }
}
