import 'dart:convert'; 
import 'package:http/http.dart' as http;



Future<List> fetchWpPost() async {
    final response = await http.get(Uri.parse("https://suba-arch.co.id/wp-json/wp/v2/posts?per_page=10"),headers:{"Accept": "application/json"} );
      List data = jsonDecode(response.body);
      return data;
  }
