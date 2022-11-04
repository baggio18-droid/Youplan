import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(-7.941351674053733, 112.60968412883584);
class Location extends StatefulWidget {
  const Location({super.key});
  @override
  _LocationState createState() => _LocationState();
}
class _LocationState extends State<Location> {
  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 14,
         )),
    );
  }
}