import 'package:flutter/material.dart';

import '../../services/settings.dart';

class WaiterDesign extends StatelessWidget {
  final double strokeWidth;
  const WaiterDesign({
    Key? key,
    this.strokeWidth = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100.0,
        width: 100.0,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          backgroundColor: DesignStyles.colorDark.withOpacity(0.5),
          color: DesignStyles.colorLight.withOpacity(0.5),
        ),
      ),
    );
  }
}
