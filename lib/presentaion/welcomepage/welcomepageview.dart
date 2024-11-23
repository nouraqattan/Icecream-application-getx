import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icecreamappgetx/presentaion/welcomepage/welcomepage_controller.dart';
import '../../widgets/elevatedBottom.dart';
class WelcomePage extends StatelessWidget {
  final WelcomeController controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final model = controller.model.value;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(model.logoPath, height: 300, width: 300),
              SizedBox(height: 20),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              GradientButton(
                text: model.getStartedButtonText,
                onPressed: () {
                  Get.toNamed('/home');
                },
              ),
              SizedBox(height: 20),
              GradientButton(
                text: model.loginButtonText,
                onPressed: () {
                  Get.toNamed('/login');
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}