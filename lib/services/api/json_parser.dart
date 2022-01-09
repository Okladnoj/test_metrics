import 'package:intl/intl.dart';

class JsonParser {
  static DateTime? stringToDateTime(String? s) {
    final _f = DateFormat('yyyy-MM-ddTHH:mm:ss');
    DateTime? dateTime;
    try {
      final _s = s?.split('.').first ?? '';
      dateTime = _f.parse(_s);
    } catch (e) {
      print(e);
    }

    return dateTime;
  }
}
