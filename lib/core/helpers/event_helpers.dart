import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutfest/core/helpers/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/event_controller.dart';
import 'package:flutfest/logic/controllers/navigation_controller.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/widgets/dialogs/custom_success_dialog.dart';
import 'package:flutfest/widgets/buttons/dialog_action_button.dart';
import 'package:share_plus/share_plus.dart';

void submitEventForm({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required CreateEventViewModel viewModel,
  required EventController eventController,
}) {
  if (!formKey.currentState!.validate()) {
    showCustomSnackBar('Please fill out all required fields');
    return;
  }

  if (viewModel.pickedImage.value == null) {
    showCustomSnackBar('Please select an image');
    return;
  }

  if (viewModel.selectedDate.value == null) {
    showCustomSnackBar('Please select a date');
    return;
  }

  final newEvent = EventModel(
    id: DateTime.now().millisecondsSinceEpoch,
    title: viewModel.titleController.text,
    location: viewModel.locationController.text,
    description: viewModel.descriptionController.text,
    date: viewModel.selectedDate.value!.toIso8601String(),
    image: viewModel.pickedImage.value!.path,
  );

  eventController.addEvent(newEvent);

  final navigationController = Get.find<NavigationController>();

  showDialog(
    context: context,
    builder: (_) => CustomAlertDialog(
      title: 'Event Created',
      content: 'Your event was successfully created!',
      actions: [
        DialogActionButton(
          label: 'Share Event',
          onPressed: () {
            Get.back();

            final title = newEvent.title ?? viewModel.titleController.text;
            final location = newEvent.location ?? viewModel.locationController.text;
            final date = viewModel.selectedDate.value != null
                ? DateFormat.yMMMMd().format(viewModel.selectedDate.value!)
                : 'Unknown date';
            SharePlus.instance.share(
              ShareParams(
                text: 'Check out this event: $title - $location on $date',
              ),
            );

          },
        ),
        const SizedBox(height: 12),
        DialogActionButton(
          label: 'Create Another',
          onPressed: () {
            Get.back();
            viewModel.resetForm();
          },
        ),
        const SizedBox(height: 12),
        DialogActionButton(
          label: 'Invite Friends',
          onPressed: () {
            Get.back();
            showCustomSnackBar('TODO: Implement invite friends logic');
          },
        ),
        const SizedBox(height: 12),
        DialogActionButton(
          label: 'Browse Events',
          onPressed: () {
            Get.offAllNamed(Routes.home);
            navigationController.setIndex(0);
          },
        ),
        const SizedBox(height: 12),
        DialogActionButton(
          label: 'Edit Event',
          onPressed: () {
            Get.back();
            Get.toNamed(Routes.createEvent, arguments: newEvent);
          },
        ),
      ],
    ),
  );
}
