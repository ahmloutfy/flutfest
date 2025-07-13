// 📁 create_event_screen.dart

import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

// Custom Alert Dialog Widget
class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: DialogTheme.of(context).backgroundColor ??
          Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

// Custom Dialog Action Button Widget
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
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key, this.event});

  final CreateEventViewModel viewModel = Get.find();
  final _formKey = GlobalKey<FormState>();
  final EventModel? event;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (viewModel.pickedImage.value == null) {
        showCustomSnackBar('Please select an image for the event');
        return;
      }

      if (viewModel.selectedDate.value == null) {
        showCustomSnackBar('Please select a date for the event');
        return;
      }

      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Event Created',
          content: 'Your event was successfully created!',
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DialogActionButton(
                    label: 'Share Event',
                    onPressed: () {
                      Get.back();

                      final eventTitle = event?.title ?? viewModel.titleController.text;
                      final eventLocation = event?.location ?? viewModel.locationController.text;
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
                      Get.back();
                      Get.toNamed(Routes.home);
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

        ),
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Create Event'), centerTitle: true),
      body: Obx(
            () => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: ElevatedButton.icon(
                    onPressed: viewModel.pickImage,
                    icon: const Icon(Icons.photo),
                    label: const Text('Add Image'),
                  ),
                ),
                const SizedBox(height: 16),
                if (viewModel.pickedImage.value != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      viewModel.pickedImage.value!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: const Center(
                      child: Text(
                        'No image selected',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: viewModel.titleController,
                  label: 'Event Title',
                  validator: (val) =>
                  val!.isEmpty ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: viewModel.locationController,
                  label: 'Location',
                  validator: (val) =>
                  val!.isEmpty ? 'Please enter a location' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  maxLines: 3,
                  controller: viewModel.descriptionController,
                  label: 'Description',
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => _pickDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Date'),
                    child: Text(
                      viewModel.selectedDate.value != null
                          ? DateFormat.yMMMMd()
                          .format(viewModel.selectedDate.value!)
                          : 'Select a date',
                      style: TextStyle(
                        color: AppTheme.getColorForTheme(
                          context: context,
                          lightModeColor: AppTheme.lightFieldTextColor,
                          darkModeColor: AppTheme.darkFieldTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => _submitForm(context),
                    icon: const Icon(Icons.check),
                    label: const Text('Create Event'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}