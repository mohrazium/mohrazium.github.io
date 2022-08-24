// GENERATED CODE - DO NOT MODIFY BY HAND

part of mohrazium.app;

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppControllerStore, Store {
  late final _$themeModeAtom =
      Atom(name: '_AppControllerStore.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AppControllerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadingTextAtom =
      Atom(name: '_AppControllerStore.loadingText', context: context);

  @override
  String get loadingText {
    _$loadingTextAtom.reportRead();
    return super.loadingText;
  }

  @override
  set loadingText(String value) {
    _$loadingTextAtom.reportWrite(value, super.loadingText, () {
      super.loadingText = value;
    });
  }

  late final _$_AppControllerStoreActionController =
      ActionController(name: '_AppControllerStore', context: context);

  @override
  void switchTheme([ThemeMode? mode]) {
    final _$actionInfo = _$_AppControllerStoreActionController.startAction(
        name: '_AppControllerStore.switchTheme');
    try {
      return super.switchTheme(mode);
    } finally {
      _$_AppControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
isLoading: ${isLoading},
loadingText: ${loadingText}
    ''';
  }
}
