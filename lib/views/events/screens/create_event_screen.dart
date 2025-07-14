import 'dart:io';

import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/event_controller.dart';
import 'package:flutfest/logic/controllers/navigation_controller.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

// Custom Action Button for Dialog
class DialogActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DialogActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(label),
      ),
    );
  }
}

// Custom Dialog after event creation
class CustomAlertDialog extends StatelessWidget {
  final EventModel event;
  final CreateEventViewModel viewModel;

  const CustomAlertDialog({
    super.key,
    required this.event,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();

    return AlertDialog(
      title: const Text('Event Created', textAlign: TextAlign.center),
      content: const Text(
        'Your event was successfully created!',
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              DialogActionButton(
                label: 'Share Event',
                onPressed: () {
                  Get.back();

                  final eventTitle = event.title ?? viewModel.titleController.text;
                  final eventLocation = event.location ?? viewModel.locationController.text;
                  final eventDate = viewModel.selectedDate.value != null
                      ? DateFormat.yMMMMd().format(viewModel.selectedDate.value!)
                      : 'Unknown date';

                  SharePlus.instance.share(
                    ShareParams(
                      text: 'Check out this event: $eventTitle - $eventLocation on $eventDate',
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
                  }
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
                  Get.to(() => CreateEventScreen(event: event),);
                },
              ),
            ],
          ),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key, this.event});

  final _formKey = GlobalKey<FormState>();
  final CreateEventViewModel viewModel = Get.find();
  final EventController eventController = Get.find();
  final NavigationController navigationController = Get.find<NavigationController>();
  final EventModel? event;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
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

      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(event: newEvent, viewModel: viewModel),
      );
    } else {
      showCustomSnackBar('Please fill out all required fields');
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogTheme: DialogThemeData(
              backgroundColor: isDark
                  ? AppTheme.darkBackgroundColor
                  : AppTheme.lightBackgroundColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                isDark ? Colors.lightBlueAccent : AppTheme.primarySeedColor,
              ),
            ),
            colorScheme: ColorScheme(
              brightness: isDark ? Brightness.dark : Brightness.light,
              primary:
              isDark ? Colors.lightBlueAccent : AppTheme.primarySeedColor,
              onPrimary: Colors.white,
              surface: isDark
                  ? AppTheme.darkBackgroundColor
                  : AppTheme.lightBackgroundColor,
              onSurface:
              isDark ? AppTheme.darkTextColor : AppTheme.lightTextColor,
              secondary: AppTheme.tertiaryColor,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      viewModel.setDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event'), centerTitle: true),
      body: Obx(
            () => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: viewModel.pickImage,
                  icon: const Icon(Icons.photo),
                  label: const Text('Add Image'),
                ),
                const SizedBox(height: 16),
                viewModel.pickedImage.value != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(viewModel.pickedImage.value!.path),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('No image selected'),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: viewModel.titleController,
                  label: 'Event Title',
                  validator: (val) => val!.isEmpty ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: viewModel.locationController,
                  label: 'Location',
                  validator: (val) => val!.isEmpty ? 'Please enter a location' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: viewModel.descriptionController,
                  label: 'Description',
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => _pickDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Date'),
                    child: Text(
                      viewModel.selectedDate.value != null
                          ? DateFormat.yMMMMd().format(viewModel.selectedDate.value!)
                          : 'Select a date',
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => _submitForm(context),
                  icon: const Icon(Icons.check),
                  label: const Text('Create Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
