part of mohrazium.constants;

const kBorderRadius = 25.0;
const kSpacing = 20.0;
const kPadding = 15.0;
const kMargin = 10.0;
const kLineWidth = 1.5;
const kAppBarHeight = 70.0;
const kElevation = 5.0;
const kTextFieldHeight = 65.0;
const kTextFieldWidth = 220.0;
const kLogoHeight = 46.0;
const kLogoWidth = 46.0;
// Font constants
const kDefaultFont = 'Sahel';
const kDefaultFallBackFont = 'Vazir';
const kFontLight = FontWeight.w300;
const kFontRegular = FontWeight.w400;
const kFontMedium = FontWeight.w500;
const kFontSemiBold = FontWeight.w600;
const kFontBold = FontWeight.w900;

// Desktop : from 1024px
// Tablet : from 839px to 1024px
// mobile : from 480px to 839px
// watch : from 226px to 480px

const kDesktopScreenBreakPoint = 1024.0;
const kTabletScreenBreakPoint = 839.0;
const kMobileScreenBreakPoint = 480.0;
const kWatchScreenBreakPoint = 200.0;

Locale get kDefaultLocale => const Locale('fa', 'IR');

const kAnimationDuration = Duration(milliseconds: 250);
