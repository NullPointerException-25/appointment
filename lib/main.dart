import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/core/services/profile_service.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/core/utils/themes.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/presentation/bindings/create_appointment_binding.dart';
import 'package:appointments_manager/features/appointment/presentation/pages/new_appointment.dart';
import 'package:appointments_manager/features/client/presentation/bindings/clients_details_binding.dart';
import 'package:appointments_manager/features/client/presentation/bindings/create_client_binding.dart';
import 'package:appointments_manager/features/client/presentation/bindings/query_clients_binding.dart';
import 'package:appointments_manager/features/client/presentation/pages/client_details_page.dart';
import 'package:appointments_manager/features/client/presentation/pages/create_client.dart';
import 'package:appointments_manager/features/user/presentation/pages/setup.dart';
import 'package:appointments_manager/home/presentation/bindings/binding.dart';
import 'package:appointments_manager/home/presentation/pages/home.dart';
import 'package:appointments_manager/splash/presentation/pages/splash.dart';
import 'package:device_preview_plus/device_preview_plus.dart' show DevicePreview;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';
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
  await loadObjectBoxLibraryAndroidCompat();
  await Get.putAsync(() => ProfileService().init());
  await Get.putAsync(
      () => ObjectBoxService().init(ProfileService.to.profile.value));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
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
          GetPage(
              name: Routes.home,
              page: () => HomePage(),
              bindings: [HomeBinding(), QueryClientsBinding()]),
          GetPage(name: Routes.setup, page: () => SetupPage()),
          GetPage(name: Routes.splash, page: () => const SplashPage()),
          GetPage(
              name: Routes.client,
              page: () => const ClientDetailsPage(),
              binding: ClientsDetailsBinding()),
          GetPage(
              name: Routes.newClient,
              page: () => const CreateClientPage(),
              binding: CreateClientBinding()),
          GetPage(
              name: Routes.newAppointment,
              page: () => const CreateAppointmentPage(),
              binding: CreateAppointmentBinding()
          )
        ],
        initialRoute: Routes.splash,
      );
  }
}
