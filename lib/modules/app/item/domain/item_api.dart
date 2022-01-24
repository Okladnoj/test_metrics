import 'package:flutter/foundation.dart';
import 'package:test_metrics/services/settings.dart';

import '../models/item_model.dart';

class ItemApi {
  final _dio = AppApi.dio;

  Future<ItemModelResponse?> getItem() async {
    ItemModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ItemModelResponse>(
        _parseItemModel,
        data,
      );
    }

    return result;
  }

  static Future<ItemModelResponse> _parseItemModel(
    Map<String, dynamic> body,
  ) async {
    return ItemModelResponse.fromJson(body);
  }
}

