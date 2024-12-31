import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/domain/repositories/appointments_repository.dart';

class CreateAppointmentUseCase extends Usecases<void> {
  late final AppointmentsRepository _appointmentsRepository;
  final AppointmentEntity appointment;

  /// Use this constructor to create a new appointment.
  /// Inject the repository on the constructor to allow for easier testing.
  /// Avoid injecting repositories directly on the use case methods.
  CreateAppointmentUseCase(
      this.appointment, AppointmentsRepository? appointmentsRepositoryLocal) {
    _appointmentsRepository =
        appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
  }

  @override
  Future<void> perform() async {
    final appointmentModel = appointment.toModel();
    await _appointmentsRepository.saveAppointment(appointmentModel);
    return;
  }
}
