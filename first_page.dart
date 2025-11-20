import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static const platform = MethodChannel("com.example.background/location");//method channel 

  Future<void> startLocationTracking() async {
    try {
      await platform.invokeMethod("startForegroundService");
    } on PlatformException catch (e) {
      print("Failed to start service: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracking Using Native Code")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => startLocationTracking(),
                child: Text("Start Tracking"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
