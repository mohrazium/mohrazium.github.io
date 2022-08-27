// GENERATED CODE - DO NOT MODIFY BY HAND

part of mohrazium.features.portfolio;

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerStore, Store {
  late final _$inAboutMePageAtom =
      Atom(name: '_HomeControllerStore.inAboutMePage', context: context);

  @override
  bool get inAboutMePage {
    _$inAboutMePageAtom.reportRead();
    return super.inAboutMePage;
  }

  @override
  set inAboutMePage(bool value) {
    _$inAboutMePageAtom.reportWrite(value, super.inAboutMePage, () {
      super.inAboutMePage = value;
    });
  }

  late final _$_HomeControllerStoreActionController =
      ActionController(name: '_HomeControllerStore', context: context);

  @override
  void switchToAboutMePage() {
    final _$actionInfo = _$_HomeControllerStoreActionController.startAction(
        name: '_HomeControllerStore.switchToAboutMePage');
    try {
      return super.switchToAboutMePage();
    } finally {
      _$_HomeControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inAboutMePage: ${inAboutMePage}
    ''';
  }
}

mixin _$AboutMeController on _AboutMeControllerStore, Store {
  late final _$modelAtom =
      Atom(name: '_AboutMeControllerStore.model', context: context);

  @override
  AboutMeModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(AboutMeModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_AboutMeControllerStore.error', context: context);

  @override
  MessageException get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(MessageException value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('_AboutMeControllerStore.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
model: ${model},
error: ${error}
    ''';
  }
}
