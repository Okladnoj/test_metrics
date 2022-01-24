import 'item_model.dart';

class ItemModelUI {
  final SecondModuleUI secondModel;
  final SecondModule? model;
  ItemModelUI(
    this.secondModel,
    this.model,
  );
}

class SecondModuleUI {
  final String string;

  SecondModuleUI(
    this.string,
  );
}
