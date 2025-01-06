import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/domain/repositories/appointments_repository.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CreateAppointmentUseCase extends Usecases<void> {
  late final AppointmentsRepository _appointmentsRepository;
  late final AppointmentEntity appointment;
  final ClientEntity client;
  final DateTime fromDate;
  final Duration duration;

  /// Use this constructor to create a new appointment.
  /// Inject the repository on the constructor to allow for easier testing.
  /// Avoid injecting repositories directly on the use case methods.
  CreateAppointmentUseCase(this.client, this.fromDate, this.duration,
      {AppointmentsRepository? appointmentsRepositoryLocal}) {
    _appointmentsRepository =
        appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;

    appointment = AppointmentEntity(
        client: client, fromDate: fromDate, toDate: fromDate.add(duration));
  }

  @override
  Future<void> perform() async {
    final appointmentModel = appointment.toModel();
    await _appointmentsRepository.saveAppointment(appointmentModel);
    Get.offNamed(Routes.home);
    return;
  }
}
