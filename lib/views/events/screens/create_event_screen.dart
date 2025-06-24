import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  File? _pickedImage;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_pickedImage == null) {
        Get.snackbar(
          'Missing Image',
          'Please select an image for the event',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Placeholder for event creation logic
      Get.back();
      Get.snackbar(
        'Success',
        'Event created successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ زر إضافة صورة
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.photo),
                label: const Text('Add Image'),
              ),
              const SizedBox(height: 16),

              // ✅ عرض الصورة المختارة أو رسالة
              if (_pickedImage != null)
                GestureDetector(
                  onTap: _pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      _pickedImage!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Center(
                    child: Text('No image selected'),
                  ),
                ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Event Title'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a location' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date'),
                  child: Text(
                    _selectedDate != null
                        ? DateFormat.yMMMMd().format(_selectedDate!)
                        : 'Select a date',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.check),
                  label: const Text('Create Event'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}