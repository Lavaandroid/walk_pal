import 'package:flutter/material.dart';
import 'package:walk_pal/SmogDataService.dart';
import 'package:walk_pal/SmogModels.dart';
import 'package:walk_pal/WeatherDataService.dart';
import 'package:walk_pal/WeatherModels.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class SmogScreen extends StatefulWidget {
  const SmogScreen({Key key}) : super(key: key);

  @override
  _SmogScreenState createState() => _SmogScreenState();
}

class _SmogScreenState extends State<SmogScreen> {

  final _latTextController = TextEditingController();
  final _lonTextController = TextEditingController();
  final _dataService = SmogDataService();

  SmogeResponse _response;
  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Center(child: Text('1000')),
            IconButton(onPressed: (){}, icon: Icon(Icons.monetization_on),)
          ],
          title: Text('Smog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [

                  Text(

                    _response.qualityInfo.currentAqi.aqilevel.aqi.toString(),
                    style: TextStyle(fontSize: 40,

                    ),
                  ),
                  Text(
                    _response.nazwaMiasta.city,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                    controller: _latTextController,
                    decoration: InputDecoration(labelText: 'lat'),
                    textAlign: TextAlign.center),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                    controller: _lonTextController,
                    decoration: InputDecoration(labelText: 'lon'),
                    textAlign: TextAlign.center),
              ),
            ),

            ElevatedButton(onPressed: _search, child: Text('Search')),
            IconButton(onPressed: _szukaj, icon: Icon(Icons.gps_fixed))

                      ]),
                  ),
                );


  }

  void _search() async {
    final response = await _dataService.getQuality(_latTextController.text, _lonTextController.text);
    setState(() => _response = response);
  }

  void _szukaj() async {
    _getCurrentLocation();
    final response = await _dataService.getQuality(_currentPosition.latitude.toString(), _currentPosition.longitude.toString());
    setState(() {
      _response = response;
    });
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
        print(_currentAddress);
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];
      var city= place.locality;

      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }


  }


}