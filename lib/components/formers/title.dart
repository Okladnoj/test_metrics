import 'package:flutter/material.dart';

import '../../services/settings.dart';

class TitleForm extends StatelessWidget {
  final String nameTitle;
  final TypeBackAction typeBackAction;
  final Future<void> Function()? subBackFunction;

  const TitleForm({
    Key? key,
    required this.nameTitle,
    this.typeBackAction = TypeBackAction.non,
    this.subBackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Row(
          children: [
            _buildPopButton(context),
          ],
        ),
        _buildNameTitle(),
      ],
    );
  }

  Widget _buildNameTitle() {
    return Text(
      nameTitle,
      style: DesignStyles.textCustom(
        fontSize: 22,
        color: DesignStyles.colorLight,
        fontWeight: FontWeight.w900,
        isHeadline: true,
      ),
    );
  }

  Widget _buildPopButton(BuildContext context) {
    if (typeBackAction == TypeBackAction.non) {
      return const SizedBox.shrink();
    }
    final isBack = typeBackAction == TypeBackAction.back;
    return InkCustomSimple(
      onTap: () async {
        Navigator.of(context).pop();
        if (subBackFunction != null) {
          await subBackFunction!();
        }
      },
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment(isBack ? 1 : 0, 0),
        color: const Color(0x00000000),
        child: Icon(
          isBack ? Icons.arrow_back_ios : Icons.close,
          size: 36,
          color: DesignStyles.colorLight,
        ),
      ),
    );
  }
}

enum TypeBackAction {
  back,
  close,
  non,
}
