import 'dart:convert' as convert;
import 'dart:developer';

import 'package:http/http.dart' as http;

class LocationService {
  final String key = 'AIzaSyBFYjs70BkE1hur2nulFtTteMXcnUx8FOg';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=cairo&inputtype=textquery&fields=place_id&key=AIzaSyBFYjs70BkE1hur2nulFtTteMXcnUx8FOg';
    var response = await http.get(Uri.parse(url));
    log(response.body);
    var json = convert.jsonDecode(response.body);
    if (json['candidates'] != null && json['candidates'].isNotEmpty) {
      var placeId = json['candidates'][0]['place_id'] as String;
      print(placeId);
      return placeId;
    } else {
      // Handle the case where no candidates are found
      throw Exception("No candidates found for the given input");
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final String placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name,geometry&key=$key';
    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    var place = json['result'] as Map<String, dynamic>;

    print(place);
    return place;
  }
}
