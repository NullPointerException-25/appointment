
import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';

class MobileCreateTemplatePage extends StatelessWidget {
  const MobileCreateTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          TemplatesAppBar()
        ],
      ),
    );
  }
}
