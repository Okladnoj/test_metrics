import 'package:flutter/cupertino.dart';

abstract class HomeListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onScreenOne<R>();
  Future<R?> onScreenTwo<R>();
  Future<R?> onScreenThree<R>();
  Future<R?> onScreenFor<R>();
}
