import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../settings.dart';

class AppApi {
  static late final Dio dio;
  static Dio? dio2;

  static void init() {
    dio2 = dio = _getDio;
  }

  static Dio get _getDio {
    return Dio(
      BaseOptions(
        baseUrl: AppPreference.baseUrl,
      ),
    )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) {
            options.headers['Authorization'] = 'Bearer ${AppPreference.token}';
            print(options.headers['token']);
            return handler.next(options);
          },
          onResponse: (response, handler) async {
            if (response.data['message'] == 'Auth token error') {
              AppPreference.logout().then(
                (value) => DesignStyles.navigatorKey.currentState?.popAndPushNamed('/'),
              );
            } else if (response.data['code'] != 1) {
              await DesignStyles.dialog(NotifyDialog(
                title: 'Code ${response.data['code']}',
                describe: response.data['message'].toString(),
                enableSecondButton: false,
                labelFirstButton: 'Close ',
                labelSecondButton: 'close',
              ));
              return handler.next(response);
            }
            return handler.next(response);
          },
          onError: (_, __) {
            if (_.response?.statusCode == 503) {
              DesignStyles.dialog(NotifyDialog(
                title: 'Code 503',
                describe: _.message,
                enableSecondButton: false,
                labelFirstButton: ' Close ',
                labelSecondButton: 'close',
              ));
            } else {
              DesignStyles.showSnackBar(_.message);
              return;
            }
          },
        ),
      );
  }
}
