import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/providers/detail_screen_provider.dart';
import 'package:jyothi_labs_test/providers/log_in_provider.dart';
import 'package:jyothi_labs_test/providers/splash_provider.dart';
import 'package:jyothi_labs_test/screens/splash.dart';
import 'package:jyothi_labs_test/utils/theme.dart';
import 'package:jyothi_labs_test/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SplashProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DetailScreenProvider(
          context.read<ProductProvider>().products,
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
