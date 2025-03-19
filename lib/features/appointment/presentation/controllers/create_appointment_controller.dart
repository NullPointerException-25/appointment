import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_preview.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/create_appointment_previews.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/create_appointment_use_case.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/get_appointments_by_date.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/usecases/get_clients_by_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/routes.dart';
import '../../../appointment_templates/domain/entities/appointment_field_entity.dart';

class CreateAppointmentController extends GetxController {
  static CreateAppointmentController get to =>
      Get.find<CreateAppointmentController>();
  final formKey = GlobalKey<FormState>();

  final clients = <ClientEntity>[].obs;
  final Rx<ClientQueryParamsDto> _params =
      Rx<ClientQueryParamsDto>(ClientQueryParamsDto());

  final clientNameSearchTextController = TextEditingController();
  final startDateTimeTextController = TextEditingController();
  final durationTextController = TextEditingController();

  final sliderValue = 1.0.obs;
  final selectedDurationString = "".obs;
  final selectedClient = Rxn<ClientEntity>();
  final Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final clientNameSearchFocusNode = FocusNode();

  final calendarFormat = Rx<CalendarFormat>(CalendarFormat.month);
  final todayAppointments = <AppointmentContract>[].obs;
  final selectedAppointmentPreview = Rxn<AppointmentPreview>();
  final customFields = RxList<AppointmentFieldEntity>([]);

  @override
  void onInit() {
    super.onInit();
    fetchClients();
    setDuration(1);
    ever(
      sliderValue,
      (callback) => setDuration(callback.toInt()),
    );
    ever(selectedDateTime, (callback) => fetchAppointments());
    ever(sliderValue, (callback) => fetchAppointments());
  }

  Future<void> fetchClients() async {
    if (clientNameSearchTextController.text.isNotEmpty) {
      _params.value = _params.value
          .copyWith(filterByName: clientNameSearchTextController.text);
      clients.value =
          await GetClientsByParamsUseCase(queryParams: _params.value).perform();
      return;
    }
    _params.value = ClientQueryParamsDto();
    clients.value =
        await GetClientsByParamsUseCase(queryParams: _params.value).perform();
  }

  void fetchAppointments() async {
    todayAppointments.value =
        await GetAppointmentsByDateUseCase(selectedDateTime.value).perform();
    getAppointmentPreviews();
  }

  void getAppointmentPreviews() async {
    todayAppointments.value = await CreateAppointmentPreviews(
      appointmentDuration: _intToDuration[sliderValue.toInt()]!,
      appointments: todayAppointments,
      selectedDay: selectedDateTime.value,
    ).perform();
    selectedAppointmentPreview.value = null;
  }

  void setSelectedAppointment(AppointmentPreview appointment) {
    selectedAppointmentPreview.value = appointment;
  }

  void selectClient(ClientEntity client) {
    selectedClient.value = client;
    clientNameSearchTextController.text = client.name;
    clientNameSearchFocusNode.unfocus();
  }

  void createAppointment() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (selectedAppointmentPreview.value == null) {
      InAppNotificationService.to.showNotificationError(
          Translator.selectAppointment.tr);
      return;
    }
    await CreateAppointmentUseCase(
            selectedClient.value!,
            selectedAppointmentPreview.value!.fromDate,
            _intToDuration[sliderValue.toInt()]!,
            customFields.toList())
        .perform();
    InAppNotificationService.to
        .showNotificationSuccess(Translator.appointmentCreated.tr);
    Get.offAllNamed(Routes.home);
  }

  int get optionsLength => _intToDuration.length;

  void setDuration(int index) {
    selectedDurationString.value =
        _durationTextMap[_intToDuration[index]!.inMinutes]!;
  }

  void addNewField() {
    customFields.add(AppointmentFieldEntity(
      title: "",
    ));
  }

  void removeField(AppointmentFieldEntity field) {
    customFields.remove(field);
  }

  final Map<int, String> _durationTextMap = {
    15: Translator.minutes.trParams({"minutes": "15"}),
    30: Translator.minutes.trParams({"minutes": "30"}),
    45: Translator.minutes.trParams({"minutes": "45"}),
    60: Translator.hour.trParams({"hours": "1"}),
    90: Translator.hourMinutes.trParams({"hours": "1", "minutes": "30"}),
    120: Translator.hour.trParams({"hours": "2"}),
    150: Translator.hourMinutes.trParams({"hours": "2", "minutes": "30"}),
    180: Translator.hour.trParams({"hours": "3"}),
    240: Translator.hour.trParams({"hours": "4"}),
    300: Translator.hour.trParams({"hours": "5"}),
    360: Translator.hour.trParams({"hours": "6"}),
    420: Translator.hour.trParams({"hours": "7"}),
  };

  final Map<int, Duration> _intToDuration = {
    1: const Duration(minutes: 15),
    2: const Duration(minutes: 30),
    3: const Duration(minutes: 45),
    4: const Duration(hours: 1),
    5: const Duration(hours: 1, minutes: 30),
    6: const Duration(hours: 2),
    7: const Duration(hours: 2, minutes: 30),
    8: const Duration(hours: 3),
    9: const Duration(hours: 4),
    10: const Duration(hours: 5),
    11: const Duration(hours: 6),
    12: const Duration(hours: 7),
  };
}
