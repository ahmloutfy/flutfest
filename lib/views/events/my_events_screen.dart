import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'All Events (or upcoming/past...)',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}