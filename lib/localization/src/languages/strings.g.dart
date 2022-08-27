
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 84 (42.0 per locale)
 *
 * Built on 2022-08-27 at 16:43 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	fa, // 'fa'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsFa _translationsFa = _StringsFa.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.fa: return _translationsFa;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.fa: return _StringsFa.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.fa: return 'fa';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.fa: return const Locale.fromSubtags(languageCode: 'fa');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'fa': return AppLocale.fa;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get languageCode => 'en';
	String get languageName => 'English';
	String get languageChanged => 'Default language changed to English.';
	String get appName => 'Mohrazium';
	String get appDescription => 'Calculate with Zoncan';
	String get appDescriptor => 'Financial reporting and management system';
	String welcome({required Object fullName}) => 'Welcome $fullName to Zoncan';
	String get save => 'Save';
	String get edit => 'Edit';
	String get cancel => 'Cancel';
	String get createdAt => 'Created At';
	String get updatedAt => 'Updated At';
	String get addNew => 'Add new';
	String get remove => 'Remove';
	String get search => 'Search';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	String get fullName => 'Full Name';
	String get yes => 'Yes';
	String get no => 'No';
	String get ok => 'Ok';
	String get accept => 'Accept';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get signup => 'Sign Up';
	String get password => 'Password';
	String get rememberMe => 'Remember Me';
	String get passwordConfirmation => 'Password Confirmation';
	String get userName => 'Username';
	String get email => 'Email';
	String get userNameEmail => 'Username / Email';
	String get userNameHint => 'User Name or email';
	String get noAccountYet => 'Not Account yet?';
	String get registerNow => 'Register Now';
	String get registered => 'You are registered';
	String get notValidUsername => 'Please enter valid username not';
	String get allowedChars => 'Allowed characters: \'@ . - _\'';
	String get loginSuccess => 'You are successfully logged in.';
	String get signupSuccess => 'You are successfully signed up.';
	String get loginFail => 'Logged in failed';
	String get signupFail => 'Signed up failed';
	String get forgetPassword => 'Forget Password?';
	String get haveAccount => 'Have an Account?';
	String get loggedIn => 'Logged in';
	String get passwordReset => 'Password Reset';
}

// Path: <root>
class _StringsFa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsFa _root = this; // ignore: unused_field

	// Translations
	@override String get languageCode => 'fa';
	@override String get languageName => 'فارسی';
	@override String get languageChanged => 'زبان پیش فرض به فارسی تغییر کرد..';
	@override String get appName => 'محرزیوم';
	@override String get appDescription => 'با زونکن حساب و کتاب کن';
	@override String get appDescriptor => 'سیستم گزارش گیری و مدیریت مالی';
	@override String welcome({required Object fullName}) => '$fullName به زونکن خوش آمدید';
	@override String get save => 'ذخیره';
	@override String get edit => 'ویرایش';
	@override String get cancel => 'لغو';
	@override String get createdAt => 'ایجاد شده در';
	@override String get updatedAt => 'بروز شده در';
	@override String get addNew => 'افزودن';
	@override String get remove => 'حذف';
	@override String get search => 'جستجو';
	@override late final _StringsLoginFa login = _StringsLoginFa._(_root);
	@override String get fullName => 'نام و نام خانوادگی';
	@override String get yes => 'بله';
	@override String get no => 'خیر';
	@override String get ok => 'باشه';
	@override String get accept => 'تایید';
}

// Path: login
class _StringsLoginFa implements _StringsLoginEn {
	_StringsLoginFa._(this._root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get login => 'ورود به سیستم';
	@override String get signup => 'ثبت نام';
	@override String get password => 'رمز عبور';
	@override String get rememberMe => 'مرا بخاطر بسپار';
	@override String get passwordConfirmation => 'تایید رمز عبور';
	@override String get userName => 'نام کاربری';
	@override String get email => 'ایمیل';
	@override String get userNameEmail => 'نام کاربری / ایمیل';
	@override String get userNameHint => 'نام کاربری یا ایمیلتان را وارد کنید';
	@override String get noAccountYet => 'هنوز حسابی ندارید؟';
	@override String get registerNow => 'ایجاد حساب';
	@override String get registered => 'حساب کاربری شما ایجاد شد';
	@override String get notValidUsername => 'لطفا نام کاربری معتبر وارد کنید';
	@override String get allowedChars => 'کاراترهای مجاز: \'@ . - _\'';
	@override String get loginSuccess => 'شما با موفقیت به سیستم وارد شدید.';
	@override String get signupSuccess => 'حساب کاربری شما با موفقیت ایجاد شد.';
	@override String get loginFail => 'ورود به سیستم ناموفق بود.';
	@override String get signupFail => 'ایجاد حساب کاربری ناموفق بود.';
	@override String get forgetPassword => 'فراموشی رمز عبور؟';
	@override String get haveAccount => 'حساب کاربری دارید؟';
	@override String get loggedIn => 'وارد شوید';
	@override String get passwordReset => 'بازیابی رمز عبور';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'languageCode': 'en',
			'languageName': 'English',
			'languageChanged': 'Default language changed to English.',
			'appName': 'Mohrazium',
			'appDescription': 'Calculate with Zoncan',
			'appDescriptor': 'Financial reporting and management system',
			'welcome': ({required Object fullName}) => 'Welcome $fullName to Zoncan',
			'save': 'Save',
			'edit': 'Edit',
			'cancel': 'Cancel',
			'createdAt': 'Created At',
			'updatedAt': 'Updated At',
			'addNew': 'Add new',
			'remove': 'Remove',
			'search': 'Search',
			'login.login': 'Login',
			'login.signup': 'Sign Up',
			'login.password': 'Password',
			'login.rememberMe': 'Remember Me',
			'login.passwordConfirmation': 'Password Confirmation',
			'login.userName': 'Username',
			'login.email': 'Email',
			'login.userNameEmail': 'Username / Email',
			'login.userNameHint': 'User Name or email',
			'login.noAccountYet': 'Not Account yet?',
			'login.registerNow': 'Register Now',
			'login.registered': 'You are registered',
			'login.notValidUsername': 'Please enter valid username not',
			'login.allowedChars': 'Allowed characters: \'@ . - _\'',
			'login.loginSuccess': 'You are successfully logged in.',
			'login.signupSuccess': 'You are successfully signed up.',
			'login.loginFail': 'Logged in failed',
			'login.signupFail': 'Signed up failed',
			'login.forgetPassword': 'Forget Password?',
			'login.haveAccount': 'Have an Account?',
			'login.loggedIn': 'Logged in',
			'login.passwordReset': 'Password Reset',
			'fullName': 'Full Name',
			'yes': 'Yes',
			'no': 'No',
			'ok': 'Ok',
			'accept': 'Accept',
		};
	}
}

extension on _StringsFa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'languageCode': 'fa',
			'languageName': 'فارسی',
			'languageChanged': 'زبان پیش فرض به فارسی تغییر کرد..',
			'appName': 'محرزیوم',
			'appDescription': 'با زونکن حساب و کتاب کن',
			'appDescriptor': 'سیستم گزارش گیری و مدیریت مالی',
			'welcome': ({required Object fullName}) => '$fullName به زونکن خوش آمدید',
			'save': 'ذخیره',
			'edit': 'ویرایش',
			'cancel': 'لغو',
			'createdAt': 'ایجاد شده در',
			'updatedAt': 'بروز شده در',
			'addNew': 'افزودن',
			'remove': 'حذف',
			'search': 'جستجو',
			'login.login': 'ورود به سیستم',
			'login.signup': 'ثبت نام',
			'login.password': 'رمز عبور',
			'login.rememberMe': 'مرا بخاطر بسپار',
			'login.passwordConfirmation': 'تایید رمز عبور',
			'login.userName': 'نام کاربری',
			'login.email': 'ایمیل',
			'login.userNameEmail': 'نام کاربری / ایمیل',
			'login.userNameHint': 'نام کاربری یا ایمیلتان را وارد کنید',
			'login.noAccountYet': 'هنوز حسابی ندارید؟',
			'login.registerNow': 'ایجاد حساب',
			'login.registered': 'حساب کاربری شما ایجاد شد',
			'login.notValidUsername': 'لطفا نام کاربری معتبر وارد کنید',
			'login.allowedChars': 'کاراترهای مجاز: \'@ . - _\'',
			'login.loginSuccess': 'شما با موفقیت به سیستم وارد شدید.',
			'login.signupSuccess': 'حساب کاربری شما با موفقیت ایجاد شد.',
			'login.loginFail': 'ورود به سیستم ناموفق بود.',
			'login.signupFail': 'ایجاد حساب کاربری ناموفق بود.',
			'login.forgetPassword': 'فراموشی رمز عبور؟',
			'login.haveAccount': 'حساب کاربری دارید؟',
			'login.loggedIn': 'وارد شوید',
			'login.passwordReset': 'بازیابی رمز عبور',
			'fullName': 'نام و نام خانوادگی',
			'yes': 'بله',
			'no': 'خیر',
			'ok': 'باشه',
			'accept': 'تایید',
		};
	}
}
