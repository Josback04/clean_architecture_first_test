import 'package:clena_architecture_test/config/theme/app_themes.dart';
import 'package:clena_architecture_test/features/daily_news/presentation/pages/daily_news.dart';
import 'package:clena_architecture_test/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DailyNews(),
    );
  }
}
