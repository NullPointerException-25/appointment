import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:get/get.dart';

class LocalAppointmentsDatasource extends GetxService{
 late final Rx<Store> _store;

  LocalAppointmentsDatasource(ObjectBoxService objectBoxService){
    _store=objectBoxService.store;
  }

  void saveAppointment(AppointmentModel appointment){
    final box = _store.value.box<AppointmentModel>();
    final result = box.put(appointment);
    if(result==0){
      throw Exception("Failed to save appointment");
    }
  }
}