import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/services/in_app_notification_service.dart';
import '../../../../core/utils/translations.dart';

class SaveAppointmentDataUseCase extends UseCase<void> {
  final AppointmentEntity _appointmentEntity;
  final List<FieldEntity> _customFields;
  late final AppointmentsRepositoryImpLocal _appointmentsRepositoryLocal;

  SaveAppointmentDataUseCase(this._appointmentEntity, this._customFields,
      {AppointmentsRepositoryImpLocal? appointmentsRepositoryLocal}) {
    _appointmentsRepositoryLocal =
        appointmentsRepositoryLocal ?? AppointmentsRepositoryImpLocal.to;
    _appointmentEntity.customFields= _customFields;
  }

  @override
  Future<void> perform() async {
    final appointmentModel = _appointmentEntity.toModel();

    try {
      await _appointmentsRepositoryLocal.saveAppointment(appointmentModel);
      Get.offAllNamed(Routes.home);
    } catch (e) {
      debugPrint(e.toString());
      InAppNotificationService.to
          .showNotificationError(Translator.somethingWentWrong.tr);
    }
  }
}
