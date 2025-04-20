import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/repositories/custom_fields_local_impl.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:appointments_manager/features/appointment_templates/mappers/custom_field_answer_mapper.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/utils/translations.dart';

class CreateAppointmentUseCase extends UseCase<void> {
  late final AppointmentsRepositoryImpLocal _appointmentsRepository;
  late final AppointmentEntity appointment;
  final ClientEntity client;
  final List<AppointmentFieldEntity> customFields;
  final DateTime fromDate;
  final Duration duration;

  /// Use this constructor to create a new appointment.
  /// Inject the repository on the constructor to allow for easier testing.
  /// Avoid injecting repositories directly on the use case methods.
  CreateAppointmentUseCase(
      this.client, this.fromDate, this.duration, this.customFields,
      {AppointmentsRepositoryImpLocal? appointmentsRepositoryLocal,
      LocalCustomFieldsRepositoryImpl? localCustomFieldsRepositoryImpl}) {
    _appointmentsRepository =
        appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
    for(final field in customFields){
      field.answer= CustomFieldAnswerMapper.defaultAnswer(field);
    }
    appointment = AppointmentEntity(
        client: client,
        fromDate: fromDate,
        toDate: fromDate.add(duration),
        customFields: customFields);
  }

  @override
  Future<void> perform() async {
    final appointmentModel = appointment.toModel();
    try {
      await _appointmentsRepository.saveAppointment(appointmentModel);
    } catch (e) {
      debugPrint(e.toString());
      InAppNotificationService.to
          .showNotificationError(Translator.somethingWentWrong.tr);
    }

    return;
  }
}
