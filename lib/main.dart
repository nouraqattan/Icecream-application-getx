import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icecreamappgetx/presentaion/detailpage/detailpageView.dart';
import 'package:icecreamappgetx/presentaion/welcomepage/welcomepageview.dart';
import 'package:icecreamappgetx/presentaion/homepage/homypageView.dart';
import 'package:provider/provider.dart';
import 'data/models/detailPage_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
      },
      child: GetMaterialApp(
        title: 'Ice Cream App with Getx',
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => WelcomePage()),
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(
            name: '/icecreamDetail',
            page: () {
              final iceCream = IceCream(
                flavor: 'Vanilla',
                image: 'asset/vanilla.png',
                description: 'Delicious vanilla ice cream',
                rating: 4.5,
              );
              return IceCreamDetailPage(iceCream: iceCream);
            },
          ),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}