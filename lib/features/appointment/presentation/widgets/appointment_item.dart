import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jiffy/jiffy.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({super.key, required this.appointment});

  final AppointmentEntity appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.black
            : ThemeColors.white,
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: appointment.client.image.value != null
            ? CircleAvatar(
                backgroundImage: FileImage(appointment.client.image.value!),
              )
            : Icon(
                HugeIcons.strokeRoundedUser,
                color: Theme.of(context).brightness == Brightness.light
                    ? ThemeColors.dark
                    : ThemeColors.white,
              ),
        title: Text(
          appointment.client.name,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.black,
          ),
        ),
        subtitle: Text(
          "${Jiffy.parse(appointment.fromDate.toIso8601String()).Hm} - ${Jiffy.parse(appointment.toDate.toIso8601String()).Hm}",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.black,
          ),
        ),
      ),
    );
  }
}
