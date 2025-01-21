import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';


class GetAppointmentsByDateUseCase extends UseCase {
  late final AppointmentsRepositoryImpLocal _appointmentsRepository;
  final DateTime date;

  //Return a List of appointments for a given date, if any. All day events are included.

  GetAppointmentsByDateUseCase(this.date, {AppointmentsRepositoryImpLocal? appointmentsRepositoryLocal}){
    _appointmentsRepository = appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
  }

  @override
  Future<List<AppointmentEntity>> perform() async {
    return (await _appointmentsRepository.getAppointmentsByDate(date)).map((e) => e.toEntity()).toList();
  }
}