import 'dart:convert';

import 'package:final_exam_flutter/model/reqres_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<RequresModel?> fetchApi() async {
    String uri = "https://reqres.in/api/users?page=1";

    http.Response res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      RequresModel requresModel = RequresModel.fromMap(data: decodedData);
      return requresModel;
    }
  }
}
