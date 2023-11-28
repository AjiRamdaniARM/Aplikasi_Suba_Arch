import 'dart:convert'; // Make sure to import this for handling JSON data
import 'package:http/http.dart' as http;



Future<List<dynamic>> fetchWpPost() async {
    final response = await http.get(Uri.parse("https://suba-arch.co.id/wp-json/wp/v2/posts?per_page=10"),headers:{"Accept": "application/json"} );
      List<dynamic> data = jsonDecode(response.body);
      return data;
  
  }
