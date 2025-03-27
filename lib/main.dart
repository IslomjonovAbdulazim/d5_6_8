import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cups = 0;
  double prevValue = 0.0;
  double currValue = 0.0;
  int currCups = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Tank
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: prevValue, end: currValue),
                    duration: Duration(milliseconds: 700),
                    builder: (context, value, child) {
                      return LiquidCircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xff5DCCFC)),
                        backgroundColor: Color(0xffF2F2F2),
                        borderColor: Color(0xff5DCCFC),
                        borderWidth: 3,
                        value: value,
                      );
                    },
                  ),
                ),
              ),

              // Buttons
            ],
          ),
        ),
      ),
    );
  }
}
