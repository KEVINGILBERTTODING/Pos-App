import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pos_app/core/models/api/response_api_model.dart';
import 'package:pos_app/core/models/user/client_model.dart';
import 'package:pos_app/core/services/remote/end_point.dart';
import 'package:pos_app/core/util/constans.dart';

class ApiService extends GetxService {
  Future<ResponseApiModel> login(Map<String, String> map) async {
    try {
      final responseApi =
          await http.post(Uri.parse(EndPoint.auth_endpoint), body: map);
      final responseJson = await jsonDecode(responseApi.body);

      if (responseApi.statusCode == 201) {
        final responApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: responseJson['message'],
            data: await ClientModel.fromJson(responseJson['data']));
        return responApiModel;
      }
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: responseJson['message'],
          data: null);
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.SERVER_ERR_STATE,
          message: 'Tidak ada koneksi internet',
          data: null);
    }
  }

  Future<ResponseApiModel> getProfile(int userId) async {
    try {
      final responseApi = await http
          .get(Uri.parse(EndPoint.profile_endpoint + userId.toString()));
      final responseJson = await jsonDecode(responseApi.body);

      if (responseApi.statusCode == 200) {
        final responApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: responseJson['message'],
            data: await ClientModel.fromJson(responseJson['data']));
        return responApiModel;
      }

      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: responseJson['message'],
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          responsestate: Constants.SERVER_ERR_STATE,
          message: 'Tidak ada koneksi internet',
          data: null);
    }
  }
}
