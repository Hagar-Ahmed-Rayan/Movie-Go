import 'package:dio/dio.dart';

import 'cache_helper.dart';


class DioHelper {
  static late Dio dio;
  static Init_dio() {
    dio = Dio(BaseOptions(

    baseUrl: 'https://api.themoviedb.org/3/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {
        required String url,
        Map<String, dynamic>? query,
        String? token

      }) async {
//print(token);
//String token=CacheHelper.getData(key: "token");
  //  print(CacheHelper.getData(key: "token"));

    dio.options.headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjVjNWFhOTQwNDVlZDc0YWZiYzlhM2IwMzM0YTBlZCIsInN1YiI6IjYzZTAyZjUzODc0MWM0MDBjN2YyOTE1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S-C-Z55GijHIC13HIIgFzeOWgiDbl4tLUUjaoPG8L38',
    //  'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }



  static Future<Response> postData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token
      }) async {
    dio.options.headers = {
      'Authorization': "Bearer $token",
    // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token}) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return dio.delete(url, queryParameters: query);

  }

}
