import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter_masterclass/app/app_prefs.dart';
import 'package:mvvm_flutter_masterclass/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
  Future<Dio> getDio() async {
    final Dio dio = Dio();

    const int _timeout = 60 * 1000;
    const Map<String, String> _headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: constToken,
      DEFAULT_LANGUAGE: "en"
    };

    dio.options = BaseOptions(
      baseUrl: constBaseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      headers: _headers,
    );

    if (kReleaseMode) {
      debugPrint("Release mode no logs");
    } else {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
        ),
      );
    }

    return dio;
  }
}
