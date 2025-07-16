import 'package:flutfest/core/helpers/pick_date_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutfest/core/helpers/event_helpers.dart';
import 'package:flutfest/logic/controllers/event_controller.dart';
import 'package:flutfest/logic/controllers/navigation_controller.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';
import 'package:flutfest/logic/models/event_model.dart';

import 'package:flutfest/widgets/fields/custom_text_field.dart';
import 'package:flutfest/widgets/fields/date_picker_field.dart';
import 'package:flutfest/widgets/images/image_picker_preview.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key, this.event});

  final _formKey = GlobalKey<FormState>();
  final CreateEventViewModel viewModel = Get.find();
  final EventController eventController = Get.find();
  final NavigationController navigationController = Get.find<NavigationController>();
  final EventModel? event;

  void _handleDatePick(BuildContext context) async {
    final picked = await PickDateHelper.show(context);
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

                // ✅ Image Preview Widget
                ImagePickerPreview(imageFile: viewModel.pickedImage.value),

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
                DatePickerField(
                  selectedDate: viewModel.selectedDate.value,
                  onTap: () => _handleDatePick(context),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => submitEventForm(
                    context: context,
                    formKey: _formKey,
                    viewModel: viewModel,
                    eventController: eventController,
                  ),
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