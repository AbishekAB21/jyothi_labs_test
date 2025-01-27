import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();

    //go Home
    WidgetsBinding.instance.addPostFrameCallback((_){

      Provider.of<SplashProvider>(context, listen: false).goHome(context);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Icon(Icons.shopping_bag_rounded, size: 50,),
      ),
    );
  }
}