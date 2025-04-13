import 'dart:io';

import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:get/get.dart';

import '../../../client/presentation/abstractions/controller_card_previewable.dart';

class DetailsAppointmentController extends GetxController
    implements ControllerClientCardPreviewable {
  static DetailsAppointmentController get to =>
      Get.find<DetailsAppointmentController>();
  late final Rx<AppointmentEntity> appointmentEntity;
  late final RxList<AppointmentFieldEntity> customFields;

  final Rx<int> currentProgressMinutes=0.obs;
  final Rx<int> diffInitialEndTimeMinutes=0.obs;


  @override
  RxString get description => appointmentEntity.value.client.description.obs;

  @override
  RxString get email => appointmentEntity.value.client.email.obs;

  @override
  Rxn<File> get image => appointmentEntity.value.client.image;

  @override
  RxString get name => appointmentEntity.value.client.name.obs;

  @override
  RxString get phone => appointmentEntity.value.client.phone.obs;



  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    final appointment=Get.arguments as AppointmentEntity;
    appointmentEntity=appointment.obs;
    customFields=appointment.customFields.obs;
    currentProgressMinutes.value=DateTime.now().difference(appointment.fromDate).inMinutes;
    diffInitialEndTimeMinutes.value=appointment.toDate.difference(appointment.fromDate).inMinutes;
  }
}
