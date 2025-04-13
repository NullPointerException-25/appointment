import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/widgets/fields/phone.dart';
import 'package:flutter/material.dart';

import '../../data/model/appointment_field.dart';
import 'fields/date_template_field.dart';
import 'fields/image_list_template_field.dart';
import 'fields/large_text_template_field.dart';
import 'fields/short_text_template_field.dart';

class TemplateFieldBuilder extends StatelessWidget {
  const TemplateFieldBuilder({super.key, required this.field});
  final AppointmentFieldEntity field;

  @override
  Widget build(BuildContext context) {

    if(field.fieldType == FormFieldType.number) {
      //return CustomFieldEditing(field: field);
    }

    if(field.fieldType == FormFieldType.shortText) {
      return ShortTextTemplateField(field);
    }

    if(field.fieldType == FormFieldType.largeText) {
      return LargeTextTemplateField(field);
    }
    if(field.fieldType == FormFieldType.date) {
      return DateTemplateField(field);
    }

    if(field.fieldType == FormFieldType.imageList) {
       return ImageListTemplateField(field);
    }

    if(field.fieldType == FormFieldType.phoneNumber){
      return PhoneNumberTemplateField(field);
    }
    return const Padding(
      padding: EdgeInsets.all(kPaddingM),
      child: Text("If you see this, this field is not compatible with your version, try updating the app"),
    );
  }
}
