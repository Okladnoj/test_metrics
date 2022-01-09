import 'package:flutter/cupertino.dart';

abstract class LoginListener<T extends StatefulWidget> implements State<T> {
  void onLoginConfirm();
}
