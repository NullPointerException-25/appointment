import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/pages/create/desktop.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/pages/create/tablet.dart';
import 'package:flutter/material.dart';

import 'mobile.dart';

class CreateTemplatesPage extends StatelessWidget {
  const CreateTemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobile: MobileCreateTemplatePage(),
        tablet: TabletCreateTemplatePage(),
        desktop: DesktopCreateTemplatePage());
  }
}
