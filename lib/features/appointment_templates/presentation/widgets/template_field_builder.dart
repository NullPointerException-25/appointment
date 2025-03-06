import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:flutter/material.dart';

import '../../data/model/appointment_field.dart';

class TemplateFieldBuilder extends StatelessWidget {
  const TemplateFieldBuilder({super.key, required this.field});
  final AppointmentFieldEntity field;

  @override
  Widget build(BuildContext context) {
    if(field.fieldType == FormFieldType.number) {
      //return CustomFieldEditing(field: field);
    }
    return Padding(
      padding: const EdgeInsets.all(kPaddingM),
      child: Text("If you see this, this field is not compatible with your version, try updating the app"),
    );
  }
}
