// 📁 create_event_screen.dart

import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/dialogs/custom_success_dialog.dart';
import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/widgets/dialogs/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key, this.event});

  final CreateEventViewModel viewModel = Get.find();
  final _formKey = GlobalKey<FormState>();
  final EventModel? event;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (viewModel.pickedImage.value == null) {
        showCustomSnackBar(context, 'Please select an image for the event');
        return;
      }

      if (viewModel.selectedDate.value == null) {
        showCustomSnackBar(context, 'Please select a date for the event');
        return;
      }

      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Event Created',
          content: 'Your event was successfully created!',
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                alignment: WrapAlignment.center,
                children: [
                  DialogActionButton(
                    label: 'Share Event',
                    onPressed: () {
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
                  DialogActionButton(
                    label: 'Create Another',
                    onPressed: () => viewModel.resetForm(),
                  ),
                  DialogActionButton(
                    label: 'Invite Friends',
                    onPressed: () => showCustomSnackBar(context, 'TODO: Implement invite friends logic'),
                  ),
                  DialogActionButton(
                    label: 'Browse Events',
                    onPressed: () => Get.toNamed(Routes.home),
                  ),
                  DialogActionButton(
                    label: 'Edit Event',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );

    } else {
      showCustomSnackBar(context, 'Please fill out all required fields');
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
                foregroundColor: isDark
                    ? Colors.lightBlueAccent
                    : AppTheme.primarySeedColor,
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
              onSurface: isDark
                  ? AppTheme.darkTextColor
                  : AppTheme.lightTextColor,
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
          padding: EdgeInsets.all(
            16,
          ),
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
                TextFormField(
                  controller: viewModel.titleController,
                  decoration: const InputDecoration(labelText: 'Event Title'),
                  validator: (val) =>
                  val!.isEmpty ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: viewModel.locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (val) =>
                  val!.isEmpty ? 'Please enter a location' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: viewModel.descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
