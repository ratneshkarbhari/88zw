import 'package:http/http.dart' as http;

class ApiService {
  Future fetchPost(url, params) async {
    var response = await http.post(url, body: params);
    return response.body;
  }
  fetchGet(url) async {
    var response = await http.get(url);
    return response.body;
  }
}
