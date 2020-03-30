import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/helpers/data_helper.dart';

class ApiService {
  static String endPoint = DataHelper.endPoint;

  Map<String, String> headers = Map<String, String>();
  Map<String, String> params = Map<String, String>();
  Map<String, dynamic> body = Map<String, dynamic>();

  // the successes status codes
  final List<int> successesCodes = [200, 201, 202, 204];

  Future<dynamic> request(HttpMethod method, String url) async {
    try {
      return validate(
          await requestInternal(method, url, params, headers, body));
    } catch (ex) {
      throw ex;
    }
  }

  Future<dynamic> requestInternal(
      HttpMethod method,
      String url,
      Map<String, String> params,
      Map<String, String> headers,
      Map<String, dynamic> body) async {
    url = getUrl(url, params);
    print(url);
    switch (method) {
      case HttpMethod.GET:
        return await http.get(
          url,
          headers: headers,
        );
      case HttpMethod.POST:
        headers.addAll({'content-type': 'application/json'});
        print(headers);
        return await http.post(url, headers: headers, body: jsonEncode(body));
      case HttpMethod.UPDATE:
        headers.addAll({'content-type': 'application/json'});
        return await http.put(url, headers: headers, body: jsonEncode(body));
      case HttpMethod.DELETE:
        return await http.delete(url, headers: headers);
      default:
        throw Exception('Unknown mehtod');
    }
  }

  //Get the full Url for the request
  String getUrl(String url, [Map<String, String> params]) {
    String finalUrl = endPoint + "" + url;
    if (params == null || params.length == 0) {
      return finalUrl;
    }
    finalUrl += "?";
    params.forEach((key, val) => {finalUrl += key + "=" + val + "&"});
    return finalUrl.substring(0, finalUrl.length - 1);
  }

  // Validate if the request has errors
  dynamic validate(http.Response response) {
    print(response.statusCode);
    if (successesCodes.contains(response.statusCode)) {
      var res = json.decode(response.body);
      print(res);
      return res;
    } else {
      print(response.body);
      final errorData = jsonDecode(response.body);
      throw ApiException(
          cause: response.body,
          url: response.request.url.toString(),
          message: errorData['message']);
    }
  }

}

enum HttpMethod {
  GET,
  UPDATE,
  POST,
  DELETE,
}

class ApiException implements Exception {
  String cause;
  String url;
  String message;

  ApiException({this.cause, this.url, this.message});
}
