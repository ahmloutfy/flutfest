import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/views/details/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.widget});

  final EventDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text('Add to favorites'),
      onPressed: () {
        Get.find<FavoriteController>().toggleFavorite(widget.event.id);
      },
      icon: GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (favController) {
          return Icon(
            favController.isFavorite(widget.event.id)
                ? Icons.favorite
                : Icons.favorite_border,
          );
        },
      ),
    );
  }
}
