import 'dart:io';

import 'package:app_q_n_a/config/share_pref.dart';
import 'package:dio/dio.dart';

import 'const.dart';
import 'path/share_pref_path.dart';

final dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        print("#################################### Url: ${options.baseUrl}${options.path}");
        // print("#################################### headers: ${options.headers}");
        // print("#################################### request: ${options.data}");
        return handler.next(options);
      },
      onResponse: (Response? response, ResponseInterceptorHandler handler) {
        // print("#################################### response: [${response?.statusCode}] >> ${response?.data}");
        // print("=================: ${response?.data["result"]}");
        return handler.next(response!);
      },
      onError: (e, handler) {
        print(
            "#################################### error: [${e.response?.statusCode}] >> ${e.response?.data}");
        ModelApiError err = ModelApiError();
        if (e.response == null) {
          err =  ModelApiError(code: null, error: "Lỗi kết nối");
        } else if (e.response?.statusCode == 400) {
          err = ModelApiError(code: e.response?.statusCode, error: "Lỗi cú pháp");
        } else if (e.response?.statusCode == 404) {
          err = ModelApiError(
              code: e.response?.statusCode, error: "Không tìm thấy tài nguyên");
        } else if (e.response?.statusCode == 500) {
          err =  ModelApiError(
              code: e.response?.statusCode,
              error: "Có lỗi hệ thống, bạn quay lại sau");
        }else{
          err =  ModelApiError(
              code: e.response?.statusCode,
              error: e.response?.data['message'] ?? e.message);
        }
        return handler.next(DioError(
          requestOptions: e.requestOptions,
          response: e.response,
          type: e.type,
          error: err,
        ));
      },
    ),
  );

class Api {
  static postAsync({required String endPoint, required Map<String, dynamic> req, bool isToken = true, bool hasForm = true}) async {
    try {
      Map<String, dynamic> headers = Map();
      headers['Content-Type'] = "application/json";
      if(isToken){
        var token = await SharedPrefs.readString(SharePrefsKey.user_token);
        headers['token'] = token;
      }

      FormData formData = FormData.fromMap(req);
      var res = await dio
          .post(
        Const.api_host + endPoint,
        data: hasForm ? formData : req,
        options: Options(
          headers: headers,
        ),
      );
      return res.data;
    }  catch (e) {
      rethrow;
    }
  }
  static getAsync({required String endPoint, bool isToken = true, String? tokenStart}) async {
    try {
      Map<String, dynamic> headers = Map();
      headers['Content-Type'] = "application/json";

      if(isToken){
        var token = await SharedPrefs.readString(SharePrefsKey.user_token);
        headers['token'] = token;
      }
      if(tokenStart != null){
        headers['token'] = tokenStart;
      }
      var res = await dio
          .get(
        Const.api_host + endPoint,
        options: Options(
          headers: headers,
        ),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
  static deleteAsync({required String endPoint, String? token}) async {
    try {
      Map<String, dynamic> headers = Map();
      headers['Content-Type'] = "application/json";

      if(token != null){
        headers['Authorization'] = "Bearer $token";
      }
      var res = await dio
          .delete(
        Const.api_host + endPoint,
        options: Options(
          headers: headers,
        ),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}

class ModelApiError {
  String? error;
  int? code;

  ModelApiError({this.code, this.error = ""});
}
