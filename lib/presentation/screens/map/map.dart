import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:synergy/data/services/getLocation.dart';
import 'package:synergy/presentation/widgets/appBar.dart';
import 'package:synergy/presentation/widgets/bottom-navbar.dart';
import 'package:synergy/utils/constants.dart';

class NearbyPeopleOnMap extends StatefulWidget {
  NearbyPeopleOnMap({Key? key}) : super(key: key);

  @override
  _NearbyPeopleOnMapState createState() => _NearbyPeopleOnMapState();
}

class _NearbyPeopleOnMapState extends State<NearbyPeopleOnMap> {
  late GoogleMapController mapController;
  var defaultLocation = LatLng(45.521563, -122.677433);
  late BitmapDescriptor myIcon;
  //Set<Marker> markers = Set.from([]);

  /* late Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId("id"),
      center: LatLng(45.521563, -122.677433),
      radius: 200,
      fillColor: Color(0xff9DCCF0).withOpacity(0.4),
      strokeWidth: 1,
      strokeColor: Color(0xff9DCCF0),
      zIndex: 0,
    )
  ]); */

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _getUserLocation() async {
    try {
      var location = await UserLocation.determinePosition();
      defaultLocation = LatLng(location.latitude, location.longitude);
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(location.latitude, location.longitude),
          zoom: 17.0,
        ),
      ));
      /* markers = Set.from([
        Marker(
          markerId: MarkerId("Saeed"),
          infoWindow: InfoWindow(title: "Saeed", snippet: "Saeed"),
          position: LatLng(location.latitude, location.longitude),
          icon: myIcon,
        )
      ]); */
      /*  circles = Set.from([
        Circle(
          circleId: CircleId("id"),
          center: LatLng(location.latitude, location.longitude),
          radius: 200,
          fillColor: Color(0xff9DCCF0).withOpacity(0.4),
          strokeWidth: 1,
          strokeColor: Color(0xff9DCCF0),
          zIndex: 0,
        )
      ]); */
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Synergy",
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          //myLocationButtonEnabled: true,

          myLocationEnabled: false,
          buildingsEnabled: true,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          //markers: markers,
          initialCameraPosition: CameraPosition(
            target: defaultLocation,
            zoom: 15.0,
          ),
          //circles: circles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _getUserLocation();

            print(defaultLocation);
          });
        },
        child: Icon(
          Icons.location_pin,
          color: Colors.white,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: 0),
    );
  }
}
