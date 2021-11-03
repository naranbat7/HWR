import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hwr_app/routes/index.dart';
import 'package:hwr_app/screens/initializer/index.dart';
import 'package:hwr_app/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: [Locale('mn', 'MN')],
      fallbackLocale: Locale('mn', 'MN'),
      path: 'assets/localization',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'appName'.tr(),
      routes: routes,
      theme: customTheme,
      home: InitializerPage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
