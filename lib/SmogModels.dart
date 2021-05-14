/*
{
"coord":[
50,
50
],
"list":[
{
"dt":1605182400,
"main":{
"aqi":1
},
"components":{
"co":201.94053649902344,
"no":0.01877197064459324,
"no2":0.7711350917816162,
"o3":68.66455078125,
"so2":0.6407499313354492,
"pm2_5":0.5,
"pm10":0.540438711643219,
"nh3":0.12369127571582794
}
}
]
}
*/


import 'dart:io';

class ListInfo {
  final int aqi;

  ListInfo({this.aqi});

  factory ListInfo.fromJson(Map<String, dynamic>json) {
    final aqi = json['aqius'];
    return ListInfo(aqi: aqi);
  }
}

class AqiInfo {
  final ListInfo aqilevel;
  AqiInfo({this.aqilevel});
  factory AqiInfo.fromJson(Map<String, dynamic> json) {
    final aqilevelJson = json['pollution'];
    final aqilevel= ListInfo.fromJson(aqilevelJson);
    return AqiInfo(aqilevel : aqilevel);
  }
}

class Current {
  final AqiInfo currentAqi;
  Current({this.currentAqi});

  factory Current.fromJson(Map<String, dynamic> json) {
    final currentAqiJson = json['current'];
    final currentAqi = AqiInfo.fromJson(currentAqiJson);
    return Current(currentAqi: currentAqi);
  }
}

class CityName {
  final String city;
  CityName({this.city});

  factory CityName.fromJson(Map<String,dynamic> json) {

    final city= json['city'];
    return CityName(city: city);

}
}



class SmogeResponse {
  final Current qualityInfo;
  final CityName nazwaMiasta;

  SmogeResponse({ this.qualityInfo, this.nazwaMiasta});

  factory SmogeResponse.fromJson(Map<String, dynamic>json) {


    final qualityInfoJson = json['data']; //[0]
    final qualityInfo = Current.fromJson(qualityInfoJson);

    final nazwaMiastaJson = json['data'];
    final nazwaMiasta = CityName.fromJson(nazwaMiastaJson);

    return SmogeResponse(
      qualityInfo: qualityInfo,
      nazwaMiasta: nazwaMiasta
    );
  }
}

/*class PollutionInfo{
  final num aqi;
  PollutionInfo({this.aqi});

  factory PollutionInfo.fromJson(Map<String, dynamic> json) {
    final aqi= json['aqius'];
    return PollutionInfo(aqi: aqi);
  }
}

class CurrentAqi {

  final PollutionInfo currentAqi;
  CurrentAqi({this.currentAqi});

  factory CurrentAqi.fromJson(Map<String, dynamic> json) {
    final currentAqiJson= json['pollution'];
    final currentAqi = PollutionInfo.fromJson(currentAqiJson);

    return CurrentAqi(currentAqi: currentAqi);
  }
}


class SmogeResponse {
  final CurrentAqi aqiInfo;
  SmogeResponse({this.aqiInfo});

  factory SmogeResponse.fromJson(Map<String,dynamic> json) {

    final aqiInfoJson = json['current'];
    final aqiInfo = CurrentAqi.fromJson(aqiInfoJson);
    return SmogeResponse(aqiInfo: aqiInfo);
  }
} */


