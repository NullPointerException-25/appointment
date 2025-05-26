import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/appointment_item_timeline.dart';
import 'package:appointments_manager/home/presentation/widgets/welcome_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/appointment/domain/entities/appointment_entity.dart';
import '../controllers/timeline_controller.dart';
import '../widgets/lastweek_plot.dart';

class HomePager extends StatelessWidget {
  const HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: double.infinity,
      width: double.infinity,
      child: CustomScrollView(
        controller: TimelineController.to.scrollController,
        slivers: [
          const SliverToBoxAdapter(child: WelcomeHomeSection()),
          const SliverToBoxAdapter(child: LastWeekPlot()),
         ObxValue<RxList<AppointmentEntity>>(
           (appointments) {
             if(appointments.isEmpty){
               return SliverToBoxAdapter(
                 child: Padding(
                   padding: const EdgeInsets.all(kPadding),
                   child: Text(
                     Translator.nothingForToday.tr,
                     style: Theme.of(context).textTheme.titleLarge,
                   ),
                 ),);
             }
             return SliverToBoxAdapter(
                 child: Padding(
                   padding: const EdgeInsets.all(kPadding),
                   child: Text(
                     Translator.today.tr,
                     style: Theme.of(context).textTheme.titleLarge,
                   ),
                 ),);
           },
           TimelineController.to.appointments
         ),
          Obx(
            () => SliverList.builder(
              itemBuilder: (context, index) {
                final appointment = TimelineController.to.appointments[index];
                return AppointmentItemTimeline(
                  appointment: appointment,
                  index: index,
                );
              },
              itemCount: TimelineController.to.appointments.length,
            ),
          ),
        ],
      ),
    );
  }
}
