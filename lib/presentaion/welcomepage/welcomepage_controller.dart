import 'package:get/get.dart';
import '../../data/models/welcomePage_model.dart';

class WelcomeController extends GetxController {
  var model = WelcomeModel(
    logoPath: 'asset/logo.png',
    title: 'Cool Treats Await!',
    description: 'Explore a delightful world of flavors and create your perfect ice cream treat!',
    getStartedButtonText: 'Started',
    loginButtonText: 'Log In',
  ).obs;
}