import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/settings.dart';
import '../buttons/ink_custom_simple.dart';
import 'custom_dropdown.dart';

class CustomButtonModalPiker<T> extends StatelessWidget {
  final Widget child;
  final List<PikModel<T>> listPikModels;
  final PikModel<T> initialItem;
  final void Function(T? date) onTap;
  final double height;

  const CustomButtonModalPiker({
    Key? key,
    required this.child,
    required this.listPikModels,
    required this.initialItem,
    required this.onTap,
    this.height = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        child,
        InkCustomSimple(
          onTap: () {
            _showPicker(context);
          },
          child: Container(height: height),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 250,
        decoration: DesignStyles.buttonDecoration(),
        child: CupertinoPicker(
          backgroundColor: DesignStyles.colorLight.withOpacity(0.8),
          itemExtent: 50,
          scrollController: FixedExtentScrollController(initialItem: initialItem.id),
          onSelectedItemChanged: (i) {
            onTap(listPikModels[i].value);
          },
          children: listPikModels.map((e) => _buildLabelOfMonth(e)).toList(),
        ),
      ),
    );
  }

  Widget _buildLabelOfMonth(PikModel<T> e) {
    return Center(
      child: Text(
        e.name ?? '',
        style: DesignStyles.textCustom(
          fontSize: 20,
          color: DesignStyles.colorDark,
        ),
      ),
    );
  }
}

class PikModel<T> {
  final int id;
  final String? name;
  final T? value;
  final Widget? listElement;
  final Widget? chooseElement;

  PikModel(
    this.id,
    this.name,
    this.value, {
    this.listElement,
    this.chooseElement,
  });
}

class PikElement<T> {
  final String name;
  final T value;

  PikElement(this.name, this.value);
}

Widget gChooserBool(
  String? title,
  bool _currentValue,
  dynamic Function(PikModel<bool>) onChanged, {
  StreamController<dynamic>? closeOpen,
}) {
  final List<PikModel<bool>> listPikModels = List.generate(2, (i) {
    final isTrue = i == 0;
    final name = isTrue ? 'Yes' : 'No';
    return PikModel(
      i,
      '$isTrue',
      isTrue,
      chooseElement: Center(
        child: Text(
          name,
          style: DesignStyles.textCustom(color: DesignStyles.colorDark, fontSize: 22),
        ),
      ),
      listElement: DropdownMenuItem<int>(
        value: i,
        child: Container(
          color: isTrue == _currentValue ? DesignStyles.transparent : DesignStyles.colorLight,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              // Text('bolusId: ${cow.bolusId * DesignStyles.maskCode}'),
            ],
          ),
        ),
      ),
    );
  });
  late PikModel<bool> initialItem;
  try {
    initialItem = listPikModels.firstWhere((e) => e.value == _currentValue);
  } catch (e) {
    print(e);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: CustomDropDown<bool>(
      initialValue: initialItem,
      hightMax: 160,
      itemsList: listPikModels,
      closeOpen: closeOpen ?? StreamController(),
      onChanged: (lactationNumber) => onChanged(lactationNumber),
      hint: Center(
        child: Text(
          title ?? '',
          style: DesignStyles.textCustom(color: DesignStyles.colorMiddle, fontSize: 16),
        ),
      ),
    ),
  );
}

Widget gChooserInt(
  String? title,
  int? _currentValue,
  int? _maxValue,
  dynamic Function(PikModel<int>) onChanged, {
  StreamController<dynamic>? closeOpen,
}) {
  final List<PikModel<int>> listPikModels = List.generate(
    _maxValue ?? 0,
    (i) => PikModel(
      i,
      '${i + 1}',
      i + 1,
      chooseElement: Center(
        child: Text(
          '${i + 1}',
          style: DesignStyles.textCustom(color: DesignStyles.colorDark, fontSize: 22),
        ),
      ),
      listElement: DropdownMenuItem<int>(
        value: i,
        child: Container(
          color: i + 1 == _currentValue ? DesignStyles.transparent : DesignStyles.colorLight,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${i + 1}'),
              // Text('bolusId: ${cow.bolusId * DesignStyles.maskCode}'),
            ],
          ),
        ),
      ),
    ),
  );
  late PikModel<int> initialItem;
  try {
    initialItem = listPikModels.firstWhere((e) => e.value == (_currentValue ?? '0'));
  } catch (e) {
    print(e);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: CustomDropDown<int>(
      initialValue: initialItem,
      itemsList: listPikModels,
      closeOpen: closeOpen ?? StreamController(),
      onChanged: (lactationNumber) => onChanged(lactationNumber),
      hint: Center(
        child: Text(
          title ?? '',
          style: DesignStyles.textCustom(color: DesignStyles.colorMiddle, fontSize: 16),
        ),
      ),
    ),
  );
}

Widget gChooserCustom<T>(
  String? title,
  PikElement<T>? currentValue,
  List<PikElement<T>>? list,
  dynamic Function(PikModel<T>) onChanged, {
  StreamController<dynamic>? closeOpen,
}) {
  final List<PikModel<T>> listPikModels = List.generate(list?.length ?? 0, (i) {
    final name = list?[i].name ?? '';
    final value = list?[i].value;
    return PikModel<T>(
      i,
      name,
      value,
      chooseElement: Center(
        child: Text(
          name,
          style: DesignStyles.textCustom(color: DesignStyles.colorMiddle, fontSize: 22),
        ),
      ),
      listElement: DropdownMenuItem<T>(
        value: value,
        child: Container(
          color: value == currentValue?.value ? DesignStyles.transparent : DesignStyles.colorLight,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              // Text('bolusId: ${cow.bolusId * DesignStyles.maskCode}'),
            ],
          ),
        ),
      ),
    );
  });
  late PikModel<T> initialItem;
  try {
    initialItem = listPikModels.firstWhere((e) => e.value == (currentValue?.value ?? '0'));
  } catch (e) {
    print(e);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: CustomDropDown<T>(
      initialValue: initialItem,
      itemsList: listPikModels,
      closeOpen: closeOpen ?? StreamController(),
      onChanged: (lactationNumber) => onChanged(lactationNumber),
      hint: Center(
        child: Text(
          title ?? '',
          style: DesignStyles.textCustom(color: DesignStyles.colorMiddle, fontSize: 16),
        ),
      ),
    ),
  );
}
