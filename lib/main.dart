import 'package:app_municipalidad_sb/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'App Municipalidad San Bartolo',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData.light(),
            localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES')
      ],
    );
  }
}

