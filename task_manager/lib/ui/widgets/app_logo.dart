import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../utills/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logoSvg);
  }
}