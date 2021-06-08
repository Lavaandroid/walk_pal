import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:walk_pal/WeatherDataService.dart';
import 'package:walk_pal/WeatherModels.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;
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
          title: Text('Weather')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response.iconUrl),
                    Text(
                      '${_response.tempInfo.temperature.toStringAsFixed(1)}°',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(_response.weatherInfo.description),
                    Text(_response.cityName)
                  ],
                ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(onPressed: _szukaj, child: Text('Szukaj')),
                  IconButton(
                    onPressed: () {
                      _askLocationPermission();
                      _search();
                    },
                      icon: Icon(Icons.location_on)),
                ],
              ),
              SizedBox(
                height: 150,
              ),

             // TextButton.icon(
               // icon: Icon(Icons.location_on),
              //  label: Text('znajdz mnie'),
              //  onPressed: _search,
               // style: ButtonStyle(
   // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
   // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
   // backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent),
   // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
   // RoundedRectangleBorder(
   // borderRadius: BorderRadius.circular(18.0),
    //side: BorderSide(color: Colors.lightGreenAccent)
   // )
              //  ),
             // )
             // )
             // ElevatedButton(onPressed: _search, child: Text('Search')),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    _getCurrentLocation();
    final response = await _dataService.getWeather(_currentAddress);
    setState(() => _response = response);
  }
  void _szukaj() async {
    final odpowiedz = await _dataService.getWeather(_cityTextController.text);
  setState(() {
    _response=odpowiedz;
  });
}

  void _askLocationPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    print(statuses[Permission.location]);
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