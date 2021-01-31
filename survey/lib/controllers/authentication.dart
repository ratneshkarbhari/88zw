import '../services/apiservice.dart';
import 'dart:convert';

class Authentication {
  loginExe(params) {
    var url = "https://codesevaco.tech/kapish_apis/login";
    var apiService = new ApiService();
    var res = apiService.fetchPost(url, params);
    res = jsonDecode(res);
    return res.body;
  }
}
