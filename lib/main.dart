import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matthiola_flower_shop/app.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/firebase_options.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDi();
  if (kDebugMode) await Upgrader.clearSavedSettings();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LocaleSettings.setPluralResolver(
    locale: AppLocale.ro,
    cardinalResolver: (n, {zero, one, two, few, many, other}) {
      if (n < 20) {
        return one ?? other!;
      }
      return other!;
    },
  );
  runApp(
    TranslationProvider(
      child: const App(),
    ),
  );
}
