import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
      final responsiveMedia = ResponsiveMedia(context);
      final responsiveBreakpoints = ResponsiveBreakpoints.of(context);

      final isSmallScreen = responsiveMedia.isSmallerThan(AspectRatioResponsive.fourThree);
      final isMediumScreen = responsiveMedia.isSmallerThan(AspectRatioResponsive.twentyOneNine) &&  responsiveBreakpoints.isTablet;

      if (isSmallScreen) return mobile;
      if (isMediumScreen) return tablet;

      return desktop;
    }

  }
