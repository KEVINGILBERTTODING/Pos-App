import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pos_app/core/models/api/response_api_model.dart';
import 'package:pos_app/core/models/app/app_model.dart';
import 'package:pos_app/core/models/category/kategori_model.dart';
import 'package:pos_app/core/models/member/member_model.dart';
import 'package:pos_app/core/models/penjualan/penjualan_model.dart';
import 'package:pos_app/core/models/product/product_model.dart';
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

  Future<ResponseApiModel> updateProfile(
      Map<String, dynamic> map, int userId) async {
    try {
      final responseApi = await http.post(
          Uri.parse(EndPoint.update_profile_endpoint + userId.toString()),
          body: map);
      final responseJson = await jsonDecode(responseApi.body);

      if (responseApi.statusCode == 200) {
        final responApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: responseJson['message'],
            data: null);
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

  Future<ResponseApiModel> getCategory() async {
    try {
      final responseApi =
          await http.get(Uri.parse(EndPoint.category_endpoints));
      if (responseApi.statusCode == 200) {
        final dataResponse = await jsonDecode(responseApi.body);
        final responseApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: 'success',
            data: (dataResponse['data'] as List)
                .map((item) => KategoriModel.fromJson(item))
                .toList());

        print(responseApiModel.data.toString());

        return responseApiModel;
      } else {
        return ResponseApiModel(
            responsestate: Constants.ERROR_STATE,
            message: 'Gagal memuat kategori',
            data: null);
      }
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: 'Server error',
          data: null);
    }
  }

  Future<ResponseApiModel> getProduct() async {
    try {
      final responseApi = await http.get(Uri.parse(EndPoint.product_endpoint));
      if (responseApi.statusCode == 200 && responseApi.body != null) {
        final dataResponse = await jsonDecode(responseApi.body);
        final responseApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: 'success',
            data: (dataResponse['data'] as List)
                .map((item) => ProductModel.fromJson(item))
                .toList());

        print(responseApiModel.data.toString());

        return responseApiModel;
      } else {
        return ResponseApiModel(
            responsestate: Constants.ERROR_STATE,
            message: 'Gagal memuat kategori',
            data: null);
      }
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: 'Server error',
          data: null);
    }
  }

  Future<ResponseApiModel> getMember() async {
    try {
      final responseApi = await http.get(Uri.parse(EndPoint.member_endpoint));
      if (responseApi.statusCode == 200 && responseApi.body != null) {
        final dataResponse = await jsonDecode(responseApi.body);
        final responseApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: 'success',
            data: (dataResponse['data'] as List)
                .map((item) => MemberModel.fromJson(item))
                .toList());

        print(responseApiModel.data.toString());

        return responseApiModel;
      } else {
        return ResponseApiModel(
            responsestate: Constants.ERROR_STATE,
            message: 'Gagal memuat member',
            data: null);
      }
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: 'Server error',
          data: null);
    }
  }

  Future<ResponseApiModel> getApp() async {
    try {
      final responseApi = await http.get(Uri.parse(EndPoint.app_endpoint));
      if (responseApi.statusCode == 200 && responseApi.body != null) {
        final dataResponse = await jsonDecode(responseApi.body);
        final responseApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: 'success',
            data: AppModel.fromJson(dataResponse['data']));

        print(responseApiModel.data.toString());

        return responseApiModel;
      } else {
        return ResponseApiModel(
            responsestate: Constants.ERROR_STATE,
            message: 'Gagal memuat data app',
            data: null);
      }
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: 'Server error',
          data: null);
    }
  }

  Future<ResponseApiModel> storeTransaction(Map<String, dynamic> data) async {
    final responseApi =
        await http.post(Uri.parse(EndPoint.store_transaction_endpoint),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));
    try {
      final dataResponse = await jsonDecode(responseApi.body);
      if (responseApi.statusCode == 200) {
        return ResponseApiModel(
            message: 'Transaksi berhasil',
            responsestate: Constants.SUCCESS_STATE,
            data: PenjualanModel.fromJson(dataResponse['data']));
      } else {
        return ResponseApiModel(
            message: 'Transaksi gagal',
            responsestate: Constants.ERROR_STATE,
            data: null);
      }
    } catch (e) {
      // print('Gagal mengirim data transaksi: $e');
      return ResponseApiModel(
          message: 'Server Error',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }

  Future<ResponseApiModel> searchProduct(String keyword) async {
    try {
      String url = EndPoint.search_product_endpoint;
      final Map<String, String> data = {'keyword': keyword};
      String queryString = Uri(queryParameters: data).query;
      String requestUrl = '$url?$queryString';
      final responseApi = await http.get(
        Uri.parse(requestUrl),
      );
      if (responseApi.statusCode == 200 && responseApi.body != null) {
        final dataResponse = await jsonDecode(responseApi.body);
        final responseApiModel = await ResponseApiModel(
            responsestate: Constants.SUCCESS_STATE,
            message: 'success',
            data: (dataResponse['data'] as List)
                .map((item) => ProductModel.fromJson(item))
                .toList());

        print(responseApiModel.data.toString());

        return responseApiModel;
      } else {
        return ResponseApiModel(
            responsestate: Constants.ERROR_STATE,
            message: 'Gagal memuat produk',
            data: null);
      }
    } catch (e) {
      return ResponseApiModel(
          responsestate: Constants.ERROR_STATE,
          message: 'Server error',
          data: null);
    }
  }

  Future<ResponseApiModel> storeCategory(String category) async {
    final Map<String, String> data = {'nama_kategori': category};
    try {
      final responseApi = await http
          .post(Uri.parse(EndPoint.category_store_endpoints), body: data);

      if (responseApi.statusCode == 200) {
        return ResponseApiModel(
            message: 'Berhasil menyimpan data',
            responsestate: Constants.SUCCESS_STATE,
            data: null);
      }

      return ResponseApiModel(
          message: 'Gagal menyimpan data',
          responsestate: Constants.ERROR_STATE,
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          message: 'Terjadi kesalahan server',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }

  Future<ResponseApiModel> destroyCategory(int categoryId) async {
    try {
      final responseApi = await http.delete(Uri.parse(
          EndPoint.category_destroy_endpoints + categoryId.toString()));

      if (responseApi.statusCode == 204) {
        return ResponseApiModel(
            message: 'Berhasil menghapus data',
            responsestate: Constants.SUCCESS_STATE,
            data: null);
      }

      return ResponseApiModel(
          message: 'Gagal menghapus data',
          responsestate: Constants.ERROR_STATE,
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          message: 'Terjadi kesalahan server',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }

  Future<ResponseApiModel> storeMember(Map<String, String> map) async {
    try {
      final responseApi =
          await http.post(Uri.parse(EndPoint.member_store_endpoint), body: map);

      if (responseApi.statusCode == 200) {
        return ResponseApiModel(
            message: 'Berhasil menyimpan data',
            responsestate: Constants.SUCCESS_STATE,
            data: null);
      }

      return ResponseApiModel(
          message: 'Gagal menyimpan data',
          responsestate: Constants.ERROR_STATE,
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          message: 'Terjadi kesalahan server',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }

  Future<ResponseApiModel> destroyMember(int memberId) async {
    try {
      final responseApi = await http.delete(
          Uri.parse(EndPoint.member_destroy_endpoint + memberId.toString()));

      if (responseApi.statusCode == 204) {
        return ResponseApiModel(
            message: 'Berhasil menghapus data',
            responsestate: Constants.SUCCESS_STATE,
            data: null);
      }

      return ResponseApiModel(
          message: 'Gagal menghapus data',
          responsestate: Constants.ERROR_STATE,
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          message: 'Terjadi kesalahan server',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }

  Future<ResponseApiModel> storeProduct(
      String imagePath, Map<String, String> map) async {
    try {
      final request = await http.MultipartRequest(
          'POST', Uri.parse(EndPoint.product_store_endpoint));

      map.forEach((key, value) {
        request.fields[key] = value;
      });

      request.files.add(await http.MultipartFile.fromPath('gambar', imagePath));

      var responseApi = await request.send();
      var responseBody = await responseApi.stream.bytesToString();

      if (responseApi.statusCode == 204) {
        return ResponseApiModel(
            message: 'Berhasil menyimpan data',
            responsestate: Constants.SUCCESS_STATE,
            data: null);
      }

      print(responseBody);
      return ResponseApiModel(
          message: 'Gagal menyimpan data',
          responsestate: Constants.ERROR_STATE,
          data: null);
    } catch (e) {
      print(e.toString());
      return ResponseApiModel(
          message: 'Terjadi kesalahan server',
          responsestate: Constants.SERVER_ERR_STATE,
          data: null);
    }
  }
}
