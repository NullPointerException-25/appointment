import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:get/get.dart';

class LocalAppointmentsDatasource extends GetxService{
  final Rx<Store> _store= ObjectBoxService.to.store!;
}