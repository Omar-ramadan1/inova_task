import 'dart:convert';
import 'package:http/http.dart';
import '../core/constants/server_url.dart';

 class GlobalController {
  // ignore: non_constant_identifier_names
  Future<Response> HttpPost(String api, Map body) async {
    var url = Uri.parse("${Urls.imageurl}$api");
    return await post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  // ignore: non_constant_identifier_names
  Future<Response> HttpGet(String api, {Map<String, String>? header}) async {
    var url = Uri.parse("${Urls.imageurl}$api");
    return await get(url, headers: header);
  }
}
