import 'package:flutter/cupertino.dart';

abstract class ScreenTwoListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onSomeMethod<R>();
}
