import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/screen_one_model.dart';

class ScreenOneApi {
  final _dio = AppApi.dio;

  Future<ScreenOneModelResponse?> getScreenOne() async {
    ScreenOneModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ScreenOneModelResponse>(
        _parseScreenOneModel,
        data,
      );
    }

    return result;
  }

  static Future<ScreenOneModelResponse> _parseScreenOneModel(
    Map<String, dynamic> body,
  ) async {
    return ScreenOneModelResponse.fromJson(body);
  }
}

