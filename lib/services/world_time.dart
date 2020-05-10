import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  List myData;
  Future<void> getData() async {
    // make the request
    Response response =
        await get('https://shrouded-savannah-97463.herokuapp.com/products');
    myData = jsonDecode(response.body);
    // // get properties from json
    // String datetime = data['datetime'];
    // String offset = data['utc_offset'].substring(1, 3);
    // //print(datetime);
    // //print(offset);

    // // create DateTime object
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    // time = now.toString();
  }
}
