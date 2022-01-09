import 'screen_one_model.dart';

class ScreenOneModelUI {
  final SecondModuleUI secondModel;
  final SecondModule? model;
  ScreenOneModelUI(
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
