import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  double _direction=0.0;
  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) {
      setState(() {
        currentLocation = location;
      });
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
          (newLoc) {

   setState(() {
     currentLocation = newLoc;
     googleMapController.animateCamera(
       CameraUpdate.newCameraPosition(
         CameraPosition(
           zoom: 16.5,
           target: LatLng(
             newLoc.latitude!,
             newLoc.longitude!,
           ),
         ),
       ),
     );
   });

      },
    );
  }

  void initState() {

    getCurrentLocation();
    setCustomMarkerIcon();
    //getPolyPoints();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          currentLocation == null
              ? const Center(child: Text("Loading"))
              : GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
              zoom: 16.5,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("currentLocation"),
                position: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                icon:currentLocationIcon,
                anchor: Offset(0.5, 0.5),
                rotation: currentLocation!.headingAccuracy!,
                draggable: false,
                zIndex: 2,
                flat: true,
              ),
              const Marker(
                markerId: MarkerId("source"),
                position: sourceLocation,
              ),
              const Marker(
                markerId: MarkerId("destination"),
                position: destination,
              ),
            },
            onMapCreated: (mapController) {
              _controller.complete(mapController);
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: polylineCoordinates,
                color: const Color(0xFF7B61FF),
                width: 6,
              ),
            },
          ),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.alarm_add_outlined),
              Text("Ride Later",style: TextStyle(color: Colors.black,fontSize: 12),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/scooter.png"),
              Text("Ride Now",style: TextStyle(color: Colors.black,fontSize: 12),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/package.png"),
              Text("Package-Delivery",style: TextStyle(color: Colors.black,fontSize: 12),)
            ],
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDlEn34-goBHulOLyVRE-3wVvoH_cJnAv8', // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/image/bike_marker.png")
        .then(
          (icon) {
       setState(() {
         currentLocationIcon = icon;
       });
      },
    );
  }
}
