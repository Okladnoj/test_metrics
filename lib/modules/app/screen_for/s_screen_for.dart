import 'package:flutter/cupertino.dart';

abstract class ScreenForListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onSomeMethod<R>();
}
