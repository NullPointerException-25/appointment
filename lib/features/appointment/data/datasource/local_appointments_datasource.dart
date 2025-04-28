import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../appointment_templates/data/model/field.dart';
import '../../../appointment_templates/data/model/field_answer.dart';

class LocalAppointmentsDatasource extends GetxService {
  late final ObjectBoxService _objectBoxService;

  static LocalAppointmentsDatasource get to =>
      Get.find<LocalAppointmentsDatasource>();

  LocalAppointmentsDatasource({ObjectBoxService? objectBoxService}) {
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }

  AppointmentModel saveAppointment(AppointmentModel appointment) {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final answerBox =
        _objectBoxService.store.value!.box<FieldAnswerModel>();
    final fieldBox = _objectBoxService.store.value!.box<FieldModel>();
    for (var field in appointment.fields) {
      if (field.answer.target != null) {
        field.answer.target!.localId = answerBox.put(field.answer.target!);
      }
      field.localId = fieldBox.put(field);
    }
    final result = box.put(appointment);

    if (result == 0) {
      throw Exception("Failed to save appointment");
    }
    return box.get(result)!;
  }

  void deleteAppointment(AppointmentModel appointment) {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final result = box.remove(appointment.localId);
    if (!result) {
      throw Exception("Failed to delete appointment");
    }
  }

  Future<List<AppointmentModel>> getAllDayAppointments(DateTime date) async {
    date = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final query = box
        .query(AppointmentModel_.fromDate.betweenDate(date, endDate))
        .order(AppointmentModel_.fromDate)
        .build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<List<AppointmentModel>> getOverlappingAppointments(
      AppointmentModel appointment) async {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final query = box
        .query(AppointmentModel_.fromDate.lessThanDate(appointment.toDate).and(
            AppointmentModel_.toDate.greaterThanDate(appointment.fromDate)))
        .build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<List<AppointmentModel>> getAppointmentsByDateRange(
      DateTime from, DateTime to) async {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final query =
        box.query(AppointmentModel_.fromDate.betweenDate(from, to)).build();
    return await query.findAsync();
  }
}
