import 'package:flutter/material.dart';

import '../../services/settings.dart';

class NotifyDialog extends StatelessWidget {
  final String title;
  final String describe;
  final String labelFirstButton;
  final String labelSecondButton;
  final bool enableFirstButton;
  final bool enableSecondButton;
  final bool isReorder;

  const NotifyDialog({
    Key? key,
    required this.title,
    required this.describe,
    required this.labelFirstButton,
    required this.labelSecondButton,
    this.enableFirstButton = true,
    this.enableSecondButton = true,
    this.isReorder = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, -1),
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 120),
          height: 220,
          decoration: DesignStyles.buttonDecoration(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(),
                    _buildDescribe(),
                    _buildActionsButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: DesignStyles.textCustom(
          color: DesignStyles.colorDark,
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildDescribe() {
    return Text(
      describe,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: DesignStyles.listNamesOfFont[NamesOfFont.nunito],
        height: 1,
        color: DesignStyles.colorDark,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
    );
  }

  Widget _buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 100,
          child: Image.asset(
            'assets/images/logo.gif',
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  Widget _buildActionsButton(BuildContext context) {
    List<Widget> children = [];

    if (enableFirstButton) {
      children.add(_buildButton(
        data: labelFirstButton,
        color: DesignStyles.colorDark,
        colorText: DesignStyles.colorLight,
        onTap: () => Navigator.of(context).pop(false),
      ));
    }

    if (enableSecondButton) {
      children.add(_buildButton(
        data: labelSecondButton,
        color: DesignStyles.colorMiddle,
        colorText: DesignStyles.colorLight,
        onTap: () => Navigator.of(context).pop(true),
      ));
    }

    if (isReorder) {
      children = children.reversed.toList();
    }

    final MainAxisAlignment mainAxisAlignment = children.length > 1 //
        ? MainAxisAlignment.spaceBetween
        : MainAxisAlignment.center;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }

  Widget _buildButton({
    String? data,
    Function()? onTap,
    Color? color,
    Color? colorText,
  }) {
    const double height = 50;
    return InkCustomSimple(
      borderRadius: BorderRadius.circular(height / 2),
      onTap: onTap ?? () {},
      child: Container(
        alignment: const Alignment(0, 0),
        decoration: DesignStyles.buttonDecoration(
          color: color,
          blurRadius: 10,
          borderRadius: height / 2,
          colorBoxShadow: DesignStyles.colorDark,
          colorBorder: color,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          data ?? '',
          textAlign: TextAlign.center,
          style: DesignStyles.textCustom(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
// return DesignDialog(
//       Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Oops', style: DesignStyles.textCustom()),
//           const SizedBox(height: 8),
//           Text(message, textAlign: TextAlign.center, style: DesignStyles.textCustom(color: DesignStyles.colorDark)),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(DesignStyles.colorDark),
//               padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
//             ),
//             child: const Text('Ok'),
//           )
//         ],
//       ),
//     );