import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 6)
class AppointmentFieldModel {
  @Id()
  int id;
  final String title;
  final int _formFieldType;
  final bool isRequired;
  final fields = ToMany<AppointmentModel>();

  @Transient()
  final Map<int, FormFieldType> _formFieldTypeEnum={
    0: FormFieldType.unknown,
    1: FormFieldType.number,
    2: FormFieldType.shortText,
    3: FormFieldType.largeText,
    4: FormFieldType.date,
    5: FormFieldType.imageList
  };

  FormFieldType get formFieldTypeEnum => _formFieldTypeEnum[_formFieldType]?? FormFieldType.unknown;

  AppointmentFieldModel(this.title, this._formFieldType, [this.isRequired=false, this.id=0]);
}

enum FormFieldType {
  number,
  shortText,
  largeText,
  date,
  imageList,
  unknown
}