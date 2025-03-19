import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/appointment/presentation/pages/details/tablet.dart';
import 'package:flutter/material.dart';

import 'desktop.dart';
import 'mobile.dart';

class DetailsAppointmentPage extends StatelessWidget {
  const DetailsAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobile: DetailsAppointmentMobilePage(),
        tablet: DetailsAppointmentTabletPage(),
        desktop: DetailsAppointmentDesktopPage());
  }
}
