import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';

import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/notifications/domain/usecases/save_notification.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/utils/translations.dart';
import '../../templates/data/repositories/custom_fields_local_impl.dart';
import '../../templates/domain/entities/field.dart';
import '../../templates/mappers/field_answer_mapper.dart';

class CreateAppointmentUseCase extends UseCase<void> {
  late final AppointmentsRepositoryImpLocal _appointmentsRepository;
  late final AppointmentEntity appointment;
  final ClientEntity client;
  final List<FieldEntity> customFields;
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
    for (final field in customFields) {
      field.answer = FieldAnswerMapper.defaultAnswer(field);
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
      InAppNotificationService.to
          .showNotificationError(Translator.somethingWentWrong.tr);
    }
    SaveNotificationUseCase(
      "Appointment reminder",
      "${appointment.client.name} Today from ${Jiffy.parse(appointment.fromDate.toIso8601String()).Hm} to ${Jiffy.parse(appointment.toDate.toIso8601String()).Hm}",
      appointment.fromDate.subtract(const Duration(hours: 1)),
    ).perform();

    return;
  }
}
