import 'package:flutter/cupertino.dart';

abstract class ScreenThreeListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onSomeMethod<R>();
}
