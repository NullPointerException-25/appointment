import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';

class AssertEventNotOverlappingOthers extends UseCase{
  late final AppointmentsRepositoryImpLocal _appointmentsRepository;
  final AppointmentEntity appointment;
  AssertEventNotOverlappingOthers(this.appointment, {AppointmentsRepositoryImpLocal? appointmentsRepositoryLocal}){
    _appointmentsRepository = appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
  }

  @override
  Future<bool> perform() async  {
    final result = await _appointmentsRepository.getOverlappingAppointments(appointment.toModel());
    return result.isEmpty;
  }
}