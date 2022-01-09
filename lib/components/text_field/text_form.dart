import 'package:flutter/services.dart';

import '../../services/settings.dart';

class TextFormDesign extends StatefulWidget {
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final ValueNotifier<TextStyle>? style;
  final ValueNotifier<String>? errorText;
  final double? height;
  final List<TextInputFormatter> inputFormatters;

  const TextFormDesign({
    Key? key,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.style,
    this.labelText,
    this.errorText,
    this.height = 87,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  _TextFormDesignState createState() => _TextFormDesignState();
}

class _TextFormDesignState extends State<TextFormDesign> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = DesignStyles.textCustom(
      fontSize: widget.style?.value.fontSize ?? 16,
      color: DesignStyles.colorMiddle,
      fontWeight: FontWeight.w400,
    );
    return Stack(
      children: [
        Column(
          children: [
            TextFormField(
              style: widget.style?.value ??
                  DesignStyles.textCustom(
                    fontSize: 20,
                    color: DesignStyles.colorDark,
                  ),
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                hintStyle: textStyle,
                labelStyle: textStyle,
                errorText: widget.errorText?.value,
                border: const OutlineInputBorder(),
                hintText: widget.hintText ?? '',
                labelText: widget.labelText,
              ),
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ],
        ),
        SizedBox(height: widget.height),
      ],
    );
  }
}
