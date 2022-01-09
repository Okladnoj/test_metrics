import 'home_model.dart';

class HomeModelUI {
  final SecondModuleUI secondModel;
  final SecondModule? model;
  HomeModelUI(
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
