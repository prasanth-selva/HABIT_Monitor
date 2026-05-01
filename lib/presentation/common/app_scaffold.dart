import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import '../screens/add_habit/add_habit_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddHabitSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
