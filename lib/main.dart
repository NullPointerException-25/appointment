import 'package:appointments_manager/presentation/pages/home.dart';
import 'package:appointments_manager/presentation/pages/setup/setup.dart';
import 'package:appointments_manager/utils/routes.dart';
import 'package:appointments_manager/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints:  [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Appointments Manager',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: Routes.home, page: () => const HomePage()),
        GetPage(name: Routes.setup, page: () => const SetupPage()),

      ],
      initialRoute: Routes.setup,
    );
  }
}

