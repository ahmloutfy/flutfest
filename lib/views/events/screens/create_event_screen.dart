// 📁 create_event_screen.dart

import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/dialogs/custom_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key});

  final CreateEventViewModel viewModel = Get.put(CreateEventViewModel(),);
  final _formKey = GlobalKey<FormState>();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (viewModel.pickedImage.value == null) {
        Get.snackbar(
          'Missing Image',
          'Please select an image for the event',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // ✅ Success Dialog
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Event Created',
          content: 'Your event was successfully created!',
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // TODO: Implement invite friends functionality
              },
              child: const Text('Invite Friends'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // TODO: Navigate to events list screen
                // Example: Get.to(() => const EventsListScreen());
              },
              child: const Text('Browse Events'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Just close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );

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
              primary: isDark
                  ? Colors.lightBlueAccent
                  : AppTheme.primarySeedColor,
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
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 100,
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
                          ? DateFormat.yMMMMd().format(
                        viewModel.selectedDate.value!,
                      )
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
