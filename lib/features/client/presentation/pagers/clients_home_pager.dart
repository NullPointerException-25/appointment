import 'package:appointments_manager/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ClientsHomePager extends StatelessWidget {
  const ClientsHomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PinnedHeaderSliver(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark?
                  ThemeColors.dark:
                  ThemeColors.white
            ),
            child: Row(
              children: [
                Text("PinnedHeaderSliver")
              ],
            ),
          ),
        ), 
        SliverList(delegate:SliverChildBuilderDelegate(
          (context, index) => Container(
            child: Text("Data"),
          ),
        ))
      ],
    );
  }
}
