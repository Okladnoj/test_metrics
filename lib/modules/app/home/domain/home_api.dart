import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/home_model.dart';

class HomeApi {
  final _dio = AppApi.dio;

  Future<HomeModelResponse?> getHome() async {
    HomeModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, HomeModelResponse>(
        _parseHomeModel,
        data,
      );
    }

    return result;
  }

  static Future<HomeModelResponse> _parseHomeModel(
    Map<String, dynamic> body,
  ) async {
    return HomeModelResponse.fromJson(body);
  }
}

