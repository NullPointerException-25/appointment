import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'desktop.dart';
import 'mobile.dart';
import 'tablet.dart';

class CreateAppointmentPage extends GetView<CreateAppointmentController> {
  const CreateAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobile: NewAppointmentMobilePage(),
        tablet: NewAppointmentTabletPage(),
        desktop: NewAppointmentDesktopPage());
  }
}
