import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/screen_two_model.dart';

class ScreenTwoApi {
  final _dio = AppApi.dio;

  Future<ScreenTwoModelResponse?> getScreenTwo() async {
    ScreenTwoModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ScreenTwoModelResponse>(
        _parseScreenTwoModel,
        data,
      );
    }

    return result;
  }

  static Future<ScreenTwoModelResponse> _parseScreenTwoModel(
    Map<String, dynamic> body,
  ) async {
    return ScreenTwoModelResponse.fromJson(body);
  }
}

