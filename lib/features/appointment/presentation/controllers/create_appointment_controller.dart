import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/usecases/get_clients_by_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CreateAppointmentController extends GetxController {
  static CreateAppointmentController get to =>
      Get.find<CreateAppointmentController>();
  final clients = <ClientEntity>[].obs;
  final Rx<ClientQueryParamsDto> _params =
      Rx<ClientQueryParamsDto>(ClientQueryParamsDto());
  final clientNameSearchTextController = TextEditingController();
  final startDateTimeTextController = TextEditingController();
  final durationTextController = TextEditingController();
  final sliderValue = 1.0.obs;
  final selectedDurationString = "".obs;
  final selectedClient = Rxn<ClientEntity>();
  DateTime? _selectedDateTime;

  @override
  void onInit() {
    super.onInit();
    fetchClients();
    setInitialDuration(4);
    ever(
      sliderValue,
      (callback) => setInitialDuration(callback.toInt()),
    );
  }

  Future<void> fetchClients() async {
    if (clientNameSearchTextController.text.isNotEmpty) {
      _params.value = _params.value
          .copyWith(filterByName: clientNameSearchTextController.text);
    }
    clients.value =
        await GetClientsByParamsUseCase(queryParams: _params.value).perform();
  }

  void selectClient(ClientEntity client) {
    selectedClient.value = client;
    clientNameSearchTextController.text = client.name;
  }

  void createAppointment() {
    // CreateAppointmentUseCase().perform();
  }

  void setDateTime() async {
    final dateTime = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (dateTime == null) {
      return;
    }
    final time = await showTimePicker(
      context: Get.context!,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );
    if(time == null) {
      return;
    }
    dateTime.add(Duration(hours: time.hour, minutes: time.minute));
    _selectedDateTime = dateTime;
    startDateTimeTextController.text =Jiffy.parse(dateTime.toIso8601String()).yMMMMEEEEdjm;
  }

  int get optionsLength => _intToDuration.length;

  void setInitialDuration(int index) {
    selectedDurationString.value =
        _durationTextMap[_intToDuration[index]!.inMinutes]!;
  }

  void addNewField() {}

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
