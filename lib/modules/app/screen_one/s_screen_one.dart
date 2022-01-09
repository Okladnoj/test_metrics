import 'package:flutter/cupertino.dart';

abstract class ScreenOneListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onSomeMethod<R>();
}
