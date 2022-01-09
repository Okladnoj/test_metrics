import 'dart:async';

import 'package:flutter/material.dart';
import '../../services/settings.dart';
import 'modal_piker.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<PikModel<T>> itemsList;
  final Function(PikModel<T> value) onChanged;
  final Widget? hint;
  final PikModel<T>? initialValue;
  final Color? dropdownColor;
  final double hightMax;
  final double hightMin;
  final StreamController? closeOpen;

  const CustomDropDown({
    Key? key,
    required this.itemsList,
    required this.onChanged,
    this.hint,
    this.initialValue,
    this.dropdownColor,
    this.hightMax = 250,
    this.hightMin = 50,
    this.closeOpen,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  PikModel<T>? _initialValue;
  late bool _expanded;
  late Duration _duration;

  @override
  void initState() {
    _duration = const Duration(milliseconds: 350);
    _initialValue = widget.initialValue;
    _expanded = false;
    widget.closeOpen?.stream.listen((event) {
      _closeOpen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      height: _expanded ? widget.hightMax : widget.hightMin,
      child: Column(
        children: [
          _buildSelectItem(),
          _buildListChooseItems(),
        ],
      ),
    );
  }

  Widget _buildSelectItem() {
    return InkCustomSimple(
      onTap: () {
        _closeOpen();
      },
      child: Container(
        height: widget.hightMin,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: DesignStyles.colorDark,
            ),
          ),
        ),
        child: Stack(
          alignment: const Alignment(1, 0),
          children: [
            _initialValue?.chooseElement ?? widget.hint ?? Container(),
            Icon(
              _expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 40,
              color: DesignStyles.colorMiddle,
            )
          ],
        ),
      ),
    );
  }

  void _closeOpen() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  Widget _buildListChooseItems() {
    return Expanded(
      child: Container(
        decoration: DesignStyles.buttonDecoration(
          blurRadius: 10,
        ),
        child: ListView(
          children: widget.itemsList
              .map(
                (e) => InkCustomSimple(
                  onTap: () {
                    _initialValue = e;
                    widget.onChanged(e);
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: SizedBox(
                    height: widget.hightMin,
                    child: e.listElement,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
