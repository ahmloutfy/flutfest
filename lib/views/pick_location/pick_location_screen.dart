import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  LatLng? _pickedLocation;

  void _onTap(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Location')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.033333, 31.233334),
              zoom: 12,
            ),
            onTap: _onTap,
            markers: _pickedLocation != null
                ? {
              Marker(
                markerId: const MarkerId('picked'),
                position: _pickedLocation!,
              )
            }
                : {},
          ),
          if (_pickedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Select This Location'),
                onPressed: () {
                  Get.back(result: '${_pickedLocation!.latitude},${_pickedLocation!.longitude}');
                },
              ),
            ),
        ],
      ),
    );
  }
}