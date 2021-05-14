import 'dart:convert';
import 'SmogModels.dart';

import 'package:http/http.dart' as http;


class SmogDataService  {

  Future <SmogeResponse> getQuality(String lat, String lon) async {

    // http://api.openweathermap.org/data/2.5/air_pollution?lat={lat}&lon={lon}&appid={API key}

    // http://api.airvisual.com/v2/nearest_city?lat={{LATITUDE}}&lon={{LONGITUDE}}&key={{YOUR_API_KEY}}
    final qParameters = {
      'lat' : lat,
      'lon' : lon,
      'key' : 'd38f19ab-eba8-4edb-aa82-a299aec3c745',
    };

    final smoguri= Uri.https(
      //'api.openweathermap.org', 'data/2.5/air_pollution', qParameters
       'api.airvisual.com', 'v2/nearest_city', qParameters
    );
    final smogresponse = await http.get(smoguri);
    print(smogresponse.body);
    final json= jsonDecode(smogresponse.body);
    return SmogeResponse.fromJson(json);
  }

}

