import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';

import '../../data/repositories/appointments_repository_imp_local.dart';

class GetAppointmentsByRangeUseCase extends UseCase<List<AppointmentEntity>> {
  late final AppointmentsRepositoryImpLocal _appointmentsRepository;
  final DateTime from;
  final DateTime to;

  GetAppointmentsByRangeUseCase(
      {required this.from,
      required this.to,
      AppointmentsRepositoryImpLocal? appointmentsRepositoryLocal}) {
    _appointmentsRepository =
        appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
  }

  @override
  Future<List<AppointmentEntity>> perform() async {
    final appointments= await _appointmentsRepository.getAppointmentsByDateRange(from, to);
    return appointments.map((e) => e.toEntity()).toList();
  }
}
