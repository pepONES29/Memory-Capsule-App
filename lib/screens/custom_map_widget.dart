import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMapWidget extends StatelessWidget {
  final LatLng initialLocation;
  final double initialZoom;

  const CustomMapWidget({
    super.key,
    required this.initialLocation,
    this.initialZoom = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialLocation, // Corrected from 'center' to 'initialCenter'
        initialZoom: initialZoom,       // Corrected from 'zoom' to 'initialZoom'
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
      ],
    );
  }
}
