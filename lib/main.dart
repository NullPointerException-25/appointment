import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/core/services/profile_service.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/core/utils/themes.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/presentation/bindings/create_appointment_binding.dart';
import 'package:appointments_manager/features/appointment/presentation/pages/details/details.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/pages/create/create.dart';
import 'package:appointments_manager/features/client/presentation/bindings/clients_details_binding.dart';
import 'package:appointments_manager/features/client/presentation/bindings/create_client_binding.dart';
import 'package:appointments_manager/features/client/presentation/bindings/query_clients_binding.dart';
import 'package:appointments_manager/features/client/presentation/pages/client_details_page.dart';
import 'package:appointments_manager/features/client/presentation/pages/create_client.dart';
import 'package:appointments_manager/features/user/presentation/pages/setup.dart';
import 'package:appointments_manager/home/presentation/bindings/binding.dart';
import 'package:appointments_manager/home/presentation/pages/home.dart';
import 'package:appointments_manager/splash/presentation/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/services/in_app_notification_service.dart';
import 'features/appointment/presentation/bindings/details_binding.dart';
import 'features/appointment/presentation/pages/create/create.dart';
import 'features/user/presentation/bindings/binding.dart';
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

  final profileService = Get.put(ProfileService());
  Get.put(ObjectBoxService());
  await profileService.init();
  Get.put(InAppNotificationService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 700, name: MOBILE),
          const Breakpoint(start: 701, end: 1280, name: TABLET),
          const Breakpoint(start: 1281, end: 1440, name: DESKTOP),
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
        GetPage(
            name: Routes.setup,
            page: () => SetupPage(),
            binding: SetupBinding()),
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
            binding: CreateAppointmentBinding()),
        GetPage(
            name: Routes.appointmentDetail,
            binding: DetailsAppointmentBinding(),
            page: () => const DetailsAppointmentPage()),
        GetPage(
          name: Routes.newTemplate,
          page: () => const CreateTemplatesPage(),
        )
      ],
      initialRoute: Routes.splash,
    );
  }
}
