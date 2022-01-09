import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/screen_three_model.dart';

class ScreenThreeApi {
  final _dio = AppApi.dio;

  Future<ScreenThreeModelResponse?> getScreenThree() async {
    ScreenThreeModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ScreenThreeModelResponse>(
        _parseScreenThreeModel,
        data,
      );
    }

    return result;
  }

  static Future<ScreenThreeModelResponse> _parseScreenThreeModel(
    Map<String, dynamic> body,
  ) async {
    return ScreenThreeModelResponse.fromJson(body);
  }
}

