import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/datetime.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/home/presentation/controllers/timeline_controller.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AppointmentItemTimeline extends StatelessWidget {
     AppointmentItemTimeline(
      {super.key, required this.appointment, required this.index});

  final AppointmentEntity appointment;
  final int index;

   late final double? currentProgress;

   late final bool isBeforeStart;

   late final bool isAfterEnd;

  void _calculateTimeProgress() {
    final currentDateTime = DateTime.now();
    isAfterEnd = currentDateTime.isAfter(appointment.toDate);
    isBeforeStart = currentDateTime.isBefore(appointment.fromDate);

    if (!currentDateTime.isBetween(
        appointment.fromDate, appointment.toDate)) {
      currentProgress = null;
      return;
    }


    final totalDuration = appointment.toDate
        .difference(appointment.fromDate)
        .inMinutes;
    final currentDuration =
        currentDateTime.difference(appointment.fromDate).inMinutes;
    currentProgress = (currentDuration / totalDuration) * 100;
  }

  @override
  Widget build(BuildContext context) {
    _calculateTimeProgress();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      decoration: BoxDecoration(
        color: currentProgress != null
            ? Theme.of(context).brightness == Brightness.light
                ? ThemeColors.ultraWhite
                : ThemeColors.dark
            : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 100,
            child: ClipRRect(
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(kCornerRadiusXXL),
                      topRight: Radius.circular(kCornerRadiusXXL),
                    )
                  : index ==
                          TimelineController.to.appointments.length - 1
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(kCornerRadiusXXL),
                          bottomRight: Radius.circular(kCornerRadiusXXL),
                        )
                      : BorderRadius.zero,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VerticalDivider(
                      thickness: 5,
                      color: isAfterEnd
                          ? ThemeColors.darkBlue
                          : ThemeColors.lightBlue),
                  if (currentProgress != null)
                    Positioned(
                      top: currentProgress,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ThemeColors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(1, 2),
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: ThemeColors.darkBlue,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      appointment.client.image.value != null
                          ? CircleAvatar(
                              radius: kIconSizeM / 2,
                              backgroundImage: FileImage(
                                  appointment.client.image.value!),
                            )
                          : const CircleAvatar(
                              radius: kIconSizeM / 2,
                              backgroundColor: ThemeColors.lightBlue,
                              child: Icon(
                                Icons.person,
                                color: ThemeColors.ultraWhite,
                              ),
                            ),
                      const SizedBox(width: kSpacing),
                      Text(
                        appointment.client.name,
                        style: const TextStyle(
                            fontSize: kFontSizeL, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    '${appointment.fromDate.toTimeOfDayString()} - ${appointment.toDate.toTimeOfDayString()}',
                    style: const TextStyle(fontSize: kFontSize),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(HugeIcons.strokeRoundedCalendar01,
                  size: kIconSizeM,
                  color: Theme.of(context).brightness == Brightness.light
                      ? ThemeColors.dark
                      : ThemeColors.ultraWhite)),
        ],
      ),
    );
  }
}
