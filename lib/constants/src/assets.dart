
class Assets {
  Assets._();

  static final fonts = _AssetsFonts._();
  static final icons = _AssetsIcons._();
  static final images = _AssetsImages._();

}

class _AssetsFonts {
  _AssetsFonts._();

  final sahel = _AssetsFontsSahel._();

}

class _AssetsFontsSahel {
  _AssetsFontsSahel._();


  final sahelTTF = 'assets/fonts/sahel/sahel.ttf';
  final sahelBlackTTF = 'assets/fonts/sahel/sahel_black.ttf';
  final sahelBoldTTF = 'assets/fonts/sahel/sahel_bold.ttf';
  final sahelLightTTF = 'assets/fonts/sahel/sahel_light.ttf';
  final sahelSemiBoldTTF = 'assets/fonts/sahel/sahel_semi_bold.ttf';
}

class _AssetsIcons {
  _AssetsIcons._();


  final errorPNG = 'assets/icons/error.png';
  final failurePNG = 'assets/icons/failure.png';
  final flagEnPNG = 'assets/icons/flag_en.png';
  final flagFaPNG = 'assets/icons/flag_fa.png';
  final infoPNG = 'assets/icons/info.png';
  final logo16PNG = 'assets/icons/logo16.png';
  final logo32PNG = 'assets/icons/logo32.png';
  final logo96PNG = 'assets/icons/logo96.png';
  final successPNG = 'assets/icons/success.png';
  final warnPNG = 'assets/icons/warn.png';
  final warningPNG = 'assets/icons/warning.png';
}

class _AssetsImages {
  _AssetsImages._();


  final bg102PNG = 'assets/images/bg102.png';
  final bg151PNG = 'assets/images/bg151.png';
  final bg41PNG = 'assets/images/bg41.png';
  final loginBackgroundJPG = 'assets/images/login_background.jpg';
  final notFoundPNG = 'assets/images/not_found.png';
}
