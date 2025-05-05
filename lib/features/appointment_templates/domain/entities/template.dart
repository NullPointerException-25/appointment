import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/template.dart';

class AppointmentTemplateEntity extends CoreEntity<AppointmentTemplateModel>{
  @override
  late DateTime  lastUpdate;

  @override
  int localId;

  @override
  String remoteId;

  String name;

  int? duration;

  AppointmentTemplateEntity({this.localId=0, this.remoteId="", this.duration, required this.name, DateTime? lastUpdate}){
    this.lastUpdate= lastUpdate?? DateTime.now();
  }
  @override
  AppointmentTemplateModel toModel() {
     return AppointmentTemplateModel(remoteId, lastUpdate, name: name, localId: localId);
  }
}