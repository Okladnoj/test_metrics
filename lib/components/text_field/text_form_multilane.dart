import 'package:flutter/material.dart';

import '../../services/settings.dart';

class TextFormMultiLineDesign extends StatefulWidget {
  final void Function(String value)? onChanged;
  final ValueNotifier<TextEditingController>? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final TextStyle? style;

  const TextFormMultiLineDesign({
    Key? key,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.style,
    this.labelText,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  _TextFormMultiLineDesignState createState() => _TextFormMultiLineDesignState();
}

class _TextFormMultiLineDesignState extends State<TextFormMultiLineDesign> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = DesignStyles.textCustom(
      fontSize: widget.style?.fontSize ?? 16,
      color: DesignStyles.colorMiddle,
      fontWeight: FontWeight.w400,
    );
    return TextFormField(
      controller: widget.controller?.value,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },

      ///
      style: widget.style ??
          DesignStyles.textCustom(
            fontSize: 20,
            color: DesignStyles.colorDark,
          ),
      minLines: widget.maxLines,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintStyle: textStyle,
        labelStyle: textStyle,
        border: const OutlineInputBorder(),
        hintText: widget.hintText ?? '',
        labelText: widget.labelText,
      ),
    );
  }
}
