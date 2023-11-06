import 'package:http/http.dart' as http;
import 'dart:convert';

class Network_Helper {
  Network_Helper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // HTTP request was successful, print the response body
      String data = response.body;

      return jsonDecode(data);
    } else {
      // Handle non-200 status codes (e.g., 404, 500, etc.)
      print('HTTP Request failed with status code: ${response.statusCode}');
    }
  }
}
