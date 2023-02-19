import 'package:flutter/material.dart';
import 'package:foodly_app/widgets/cart_item.dart';
import 'package:foodly_app/widgets/navbar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../custom_text.dart';
import '../widgets/shopping_cart.dart';

class LocationPage extends StatefulWidget {


  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String locationMessage = 'Current Location of the User';
  
  late String lat;

  late String long;

  Widget _title() {
    return const Center(child: Text('FOODLY'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 197, 47),
        centerTitle: true,
        title: _title(),
        actions: <Widget>[
          IconButton(onPressed: () => Null, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartWidget()),
                  ),
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: CustomText(
              text: "OUR LOCATION",
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(locationMessage, textAlign: TextAlign.center,),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation().then((value){
                 lat = '${value.latitude}';
                 long = '${value.longitude}';
                 setState((){
                  locationMessage = 'Latitude: $lat, Longitude: $long';
                 });
                 _liveLocation();
              });
            },
            child: const Text('Get Current Location')),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                _openMap(lat, long);
              }, 
              child: const Text('Open Google Map'))
        ],
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error('Location service is disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied)
    {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');
      }
    }

    if(permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }
  
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    
    Geolocator.getPositionStream(locationSettings: locationSettings)
    .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat, Longitude: $long';
      });
    });}
}

Future<void> _openMap(String lat, String long) async {
  String googleURL = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  await canLaunchUrlString(googleURL)
    ? await launchUrlString(googleURL)
    : throw 'Could not launch $googleURL';
}
