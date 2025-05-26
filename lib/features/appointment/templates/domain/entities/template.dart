import 'package:appointments_manager/core/abstractions/entity.dart';

import '../../data/model/template.dart';
import 'field.dart';

class AppointmentTemplateEntity extends CoreEntity<AppointmentTemplateModel>{
  @override
  late DateTime  lastUpdate;

  @override
  int localId;

  @override
  String remoteId;

  String name;

  int? duration;

  List<FieldEntity> fields = <FieldEntity>[];

  AppointmentTemplateEntity({this.localId=0, this.remoteId="", this.duration, required this.name, DateTime? lastUpdate, List<FieldEntity>? fields}){
    this.lastUpdate= lastUpdate?? DateTime.now();
    this.fields = fields ?? [];

  }
  @override
  AppointmentTemplateModel toModel() {
     return AppointmentTemplateModel(remoteId, lastUpdate, name: name, localId: localId, duration: duration);
  }
}