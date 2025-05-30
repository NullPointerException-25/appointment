import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_preview.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/create_appointment_previews.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/create_appointment_use_case.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/get_appointments_by_date.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/select_appointment_buttom_sheet.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/usecases/get_clients_by_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/routes.dart';
import '../../templates/domain/contracts/slidable_controller.dart';
import '../../templates/domain/entities/field.dart';
import '../../templates/domain/entities/template.dart';
import '../../templates/domain/usecases/delete_template.dart';
import '../../templates/domain/usecases/get_templates.dart';

class CreateAppointmentController extends SlidableController{
  static CreateAppointmentController get to =>
      Get.find<CreateAppointmentController>();
  final formKey = GlobalKey<FormState>();

  final clients = <ClientEntity>[].obs;
  final Rx<ClientQueryParamsDto> _params =
      Rx<ClientQueryParamsDto>(ClientQueryParamsDto());

  final clientNameSearchTextController = TextEditingController();
  final startDateTimeTextController = TextEditingController();
  final durationTextController = TextEditingController();

  final selectedClient = Rxn<ClientEntity>();
  final Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final clientNameSearchFocusNode = FocusNode();

  final calendarFormat = Rx<CalendarFormat>(CalendarFormat.month);
  final todayAppointments = <AppointmentContract>[].obs;
  final selectedAppointmentPreview = Rxn<AppointmentPreview>();
  final customFields = RxList<FieldEntity>([]);
  final templates = <AppointmentTemplateEntity>[].obs;

  CreateAppointmentController(){
    sliderValue=RxDouble(1);
    selectedDurationString=RxString("");
    selectedDuration=RxInt(1);
  }

  @override
  void onInit() {
    fetchTemplates();
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

  void fetchTemplates() async {
    templates.value = await GetTemplatesUseCase().perform();
    if(templates.isEmpty){
      return;
    }
    Get.bottomSheet(SelectTemplateBottomSheet(templates));
  }

  void loadFields(AppointmentTemplateEntity template) {
    customFields.value = template.fields;
    for (var e in template.fields) {
      e.answer?.localId=0;
      e.localId=0;
    }
    sliderValue.value = template.duration!=null? template.duration!.toDouble(): 1;
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
      appointmentDuration: intToDuration[sliderValue.toInt()]!,
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
            intToDuration[sliderValue.toInt()]!,
            customFields.toList())
        .perform();
    InAppNotificationService.to
        .showNotificationSuccess(Translator.appointmentCreated.tr);
    Get.offAllNamed(Routes.home);
  }



  void setDuration(int index) {
    selectedDurationString.value =
        durationTextMap[intToDuration[index]!.inMinutes]!;
  }

  void addNewField() {
    customFields.add(FieldEntity(
      title: "",
    ));
  }

  void removeField(FieldEntity field) {
    customFields.remove(field);
  }

  void deleteTemplate(AppointmentTemplateEntity template) {
    DeleteTemplateUseCase(template).perform();
    templates.remove(template);
  }




}
