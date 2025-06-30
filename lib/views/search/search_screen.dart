import 'package:flutfest/logic/controllers/search_controller.dart';
import 'package:flutfest/views/details/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/models/event_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController controller = Get.put(SearchScreenController(),);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller.textController,
          onChanged: controller.search,
          decoration: InputDecoration(
            hintText: 'Search events...',
            border: InputBorder.none,
            suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
                ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: controller.clearSearch,
            )
                : SizedBox.shrink(),),
          ),
          autofocus: true,
        ),
      ),
      body: Obx(() {
        if (controller.searchQuery.value.isEmpty) {
          return Center(
            child: Text('Search for something'),
          );
        }

        if (controller.searchResults.isEmpty) {
          return Center(
            child: Text('No results found'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            EventModel event = controller.searchResults[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    event.image!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  event.title!,
                  style: theme.textTheme.titleMedium,
                ),
                subtitle: Text(event.location!),
                onTap: () {
                  Get.to(() => EventDetailsScreen(event: event),);
                },
              ),
            );
          },
        );
      }),
    );
  }
}