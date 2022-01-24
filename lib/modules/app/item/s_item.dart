import 'package:flutter/cupertino.dart';

abstract class ItemListener<T extends StatefulWidget> implements State<T> {
  Future<R?> onOpenItem<R>(String nameItem, Color color);
}
