import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/screen_for_model.dart';

class ScreenForApi {
  final _dio = AppApi.dio;

  Future<ScreenForModelResponse?> getScreenFor() async {
    ScreenForModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ScreenForModelResponse>(
        _parseScreenForModel,
        data,
      );
    }

    return result;
  }

  static Future<ScreenForModelResponse> _parseScreenForModel(
    Map<String, dynamic> body,
  ) async {
    return ScreenForModelResponse.fromJson(body);
  }
}

