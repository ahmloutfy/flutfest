import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/views/notifications/notifications_screen.dart';
import 'package:flutfest/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(BuildContext context, String title, {TextStyle? textStyle}) {
  return AppBar(
    title: Text(
      title,
      style: textStyle ?? Theme.of(context).textTheme.headlineSmall,
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {
          Get.to(() => const NotificationsScreen(),);
        },
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Get.to(() => const SearchScreen(),);
          showCustomSnackBar(context, 'Search for events');
        },
      ),
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          showCustomSnackBar(context, 'Configure settings');
        },
      ),
    ],
  );
}