import 'package:flutter/material.dart';

class HomePager extends StatelessWidget {
  const HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                color: Theme.of(context).colorScheme.surface,
                child: const Center(
                  child: Text('Appointments'),
                ),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
