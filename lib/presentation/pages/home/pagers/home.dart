import 'package:appointments_manager/presentation/pages/home/widgets/welcome_home.dart';
import 'package:appointments_manager/utils/global_values.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class HomePager extends StatelessWidget {
  const HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: double.infinity,
      width: double.infinity,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: WelcomeHomeSection()),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                margin: const EdgeInsets.all(kPaddingM),
                padding: const EdgeInsets.all(kPaddingM),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointments',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: kPaddingM),
                    const Text('Appointments list'),
                  ],
                ),
              );
            },
            childCount: 5,
          )),
        ],
      ),
    );
  }
}
