import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalLocalizationWrapper implements GlobalLocalization {
  GlobalLocalizationWrapper._(this.localizations);

  AppLocalizations localizations;

  static GlobalLocalizationWrapper? of(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      return null;
    }
    final wrapper = GlobalLocalizationWrapper._(localizations);
    return wrapper;
  }

  @override
  String get appCopyright => localizations.appCopyright;
}
