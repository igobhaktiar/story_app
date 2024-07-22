import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class GradientCustomWidget extends StatelessWidget {
  const GradientCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsAssets.raisinBlack,
            ColorsAssets.primary,
          ],
        ),
      ),
    );
  }
}
