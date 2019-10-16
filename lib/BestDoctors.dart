import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'DoctorDataTypes.dart';


class Speciality {
  String uid;
  String name;
  String description;
  String category;
  String actor;
  String actors;

  Speciality({

    this.uid,
    this.name,
    this.description,
    this.category,
    this.actor,
    this.actors,
  });

  factory Speciality.fromJson(Map<String, dynamic> json)  {
    return new Speciality(
        uid: json['uid'],
        name: json['name'],
        description: json['description'],
        category: json['category'],
        actor: json['actor'],
        actors: json['actors']
    );
  }
}

class SpecialityMetaData {
  String data_type;
  int total;
  int count;
  int skip;
  int limit;

  SpecialityMetaData({
    this.data_type,
    this.total,
    this.count,
    this.skip,
    this.limit,

  });

  factory SpecialityMetaData.fromJson(Map<String, dynamic> json) {
    return new SpecialityMetaData(
        data_type: json['data_type'],
        total: json['total'],
        count: json['count'],
        skip: json['skip'],
        limit: json['limit']
    );
  }
}

class SpecialityResponse {

  SpecialityMetaData meta;

  List<Speciality> data;

  SpecialityResponse({
    this.meta,
    this.data
  });

  factory SpecialityResponse.fromJson(Map<String, dynamic> json) {

    return new SpecialityResponse(
        meta: SpecialityMetaData.fromJson(json['meta']),
        data: (json['data'] as List).map((value) => new Speciality.fromJson(value)).toList()
    );
  }
}


class BestDoctors {

  static String END_PONT = "api.betterdoctor.com";

  SpecialityResponse specialites;


  Future<List<Speciality>> LoadSpecialities() async {
    // Null check so our app isn't doing extra work.
    if (specialites != null) {
      return specialites.data;
    }

    // http calls are invoke in flutter:
    HttpClient http = HttpClient();
    var queryParameters = {
      'user_key': '1adfaa3e79fb56006b835596dfa22d41'
    };

    try {
      // Use darts Uri builder
      var uri = Uri.https( END_PONT, '/2016-03-01/specialties' , queryParameters);

      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      // results = json.decode(responseBody)['message'];

      var result = json.decode(responseBody);

      specialites = new SpecialityResponse.fromJson(result);
      debugPrint(responseBody.toString());
      debugPrint(specialites.meta.data_type);

      debugPrint(specialites.data[0].description);
    } catch (exception) {
      print(exception);
    }

    return specialites.data;
  }



  Future<DoctorsByUIDResponse> getDoctoryByUId (String doctorUid) async{

    HttpClient http = HttpClient();
    var queryParameters = {
      'user_key': '1adfaa3e79fb56006b835596dfa22d41',
    };

    debugPrint("UID=====>>>"+doctorUid);

    try {

      var uri = Uri.https( END_PONT, '/2016-03-01/doctors/'+doctorUid , queryParameters);

      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      var result = json.decode(responseBody);

      debugPrint(responseBody);

      DoctorsByUIDResponse res = new DoctorsByUIDResponse.fromJson(result);

      debugPrint(res.data.profile.firstName);

      return res;

    } catch (exception) {
      print(exception);
    }

    return null;
  }


  Future<DoctorSearchResponse> searchDoctor(String location, String specialty_uid) async{

    HttpClient http = HttpClient();
    var queryParameters = {
      'user_key': '1adfaa3e79fb56006b835596dfa22d41',
      'location' : location != null ? location : "37.773,-122.413,100",
      "fields" : "profile,uid",
      "specialty_uid" : specialty_uid

    };

    try {

      var uri = Uri.https( END_PONT, '/2016-03-01/doctors/' , queryParameters);

      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      var result = json.decode(responseBody);

      debugPrint(responseBody);

      DoctorSearchResponse res = new DoctorSearchResponse.fromJson(result);


      debugPrint(res.data[0].profile.firstName);

      return res;

    } catch (exception) {
      print(exception);
    }

    return null;
  }
}
