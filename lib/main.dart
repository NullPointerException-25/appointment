
import 'package:appointments_manager/presentation/pages/home.dart';
import 'package:appointments_manager/presentation/pages/setup/setup.dart';
import 'package:appointments_manager/presentation/splash.dart';
import 'package:appointments_manager/services/object_box_service.dart';
import 'package:appointments_manager/services/profile_service.dart';
import 'package:appointments_manager/utils/routes.dart';
import 'package:appointments_manager/utils/themes.dart';
import 'package:appointments_manager/utils/translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

 initServices() async {
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  await Get.putAsync(() => ProfileService().init());
  await Get.putAsync(() => ObjectBoxService().init(ProfileService.to.profile.value));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints:  [
      const Breakpoint(start: 0, end: 600, name: MOBILE),
      const Breakpoint(start: 601, end: 1024, name: TABLET),
      const Breakpoint(start: 1025, end: 1440, name: DESKTOP),
      const Breakpoint(start: 1441, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Appointments Manager',
      translations: Translator(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: Routes.home, page: () => const HomePage()),
        GetPage(name: Routes.setup, page: () =>  SetupPage()),
        GetPage(name: Routes.splash, page: () => const SplashPage()),
      ],
      initialRoute: Routes.splash,
    );
  }
}

