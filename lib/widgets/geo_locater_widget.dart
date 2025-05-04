import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocaterWidget extends StatefulWidget {
  const GeoLocaterWidget({super.key});
  @override
  State<GeoLocaterWidget> createState() => _GeoLocaterWidgetState();
}

class _GeoLocaterWidgetState extends State<GeoLocaterWidget> {
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  bool isLoading=false;

  Future<Position?> _getCurrentLocation() async {
    print("function call");
    servicePermission = await Geolocator.isLocationServiceEnabled();
    print(servicePermission);
    if (!servicePermission) {
      print("Service Disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    _currentLocation= await Geolocator.getCurrentPosition();
    setState(() {
      isLoading=false;
    });
      return _currentLocation;

    // return null;
  }


  @override
  Widget build(BuildContext context) {
    return isLoading?Center(child: CircularProgressIndicator(),):Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Location Coordinates",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude}",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading=true;
                });
                _currentLocation = await _getCurrentLocation();
              },
              child: Text('get location'))
        ],
      ),
    );
  }
}
