import 'package:http/http.dart' as http;

class ApiService {
  fetchPost(url, params) async {
    var response = await http.post(url, body: params);
    return response.body;
  }
}
