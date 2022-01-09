import 'screen_three_model.dart';

class ScreenThreeModelUI {
  final SecondModuleUI secondModel;
  final SecondModule? model;
  ScreenThreeModelUI(
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
