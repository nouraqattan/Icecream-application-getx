import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icecreamappgetx/data/models/detailPage_model.dart';
import 'package:icecreamappgetx/presentaion/detailpage/detailpage_controller.dart';
import '../../utils/assets.dart';
import '../../widgets/paintwavewidget.dart';

class IceCreamDetailPage extends StatelessWidget {
  final IceCream iceCream;
  final IceCreamController controller;
  IceCreamDetailPage({required this.iceCream})
      : controller = Get.put(IceCreamController(iceCream));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('${controller.iceCream.flavor} ',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Details',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 200,
            child: CustomPaint(
              size: Size(double.maxFinite, 200),
              painter: WavelengthWavePainter(offset: 0),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 144.0, right: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          _buildToppingOption('Strawberry', ToppingAssetPaths.toppingImages[0]),
                          _buildToppingOption('Chocolate', ToppingAssetPaths.toppingImages[1]),
                          _buildToppingOption('Banana', ToppingAssetPaths.toppingImages[2]),
                          _buildToppingOption('Mango', ToppingAssetPaths.toppingImages[3]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 2),
                        child: Image.asset(
                          controller.iceCream.image,
                          height: 330,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        controller.iceCream.flavor,
                        style: TextStyle(
                          fontSize:29,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        //  color: Colors.white
                        ),
                      ),
                      //SizedBox(width: 130),
                      Row(
                        children: [
                          Text(
                            'Rating: ${controller.iceCream.rating}',
                            style: TextStyle(fontSize: 22,
                               // color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.star, color: Colors.amber),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    controller.iceCream.description,
                    style: TextStyle(
                      fontSize: 16,
                     //color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    return Text(
                      'Selected Toppings: ${controller.selectedToppings.join(', ')}',
                      style: TextStyle(fontSize: 16,
                          //color: Colors.white
                      ),
                    );
                  }),
                  SizedBox(height: 50),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color:
                        Colors.white, width: 2), // White border
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.snackbar(
                            'Order Placed',
                            'Order for ${controller.iceCream.flavor} placed!',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            borderRadius: 25,
                            margin: EdgeInsets.all(10),
                            icon: Icon(Icons.check_circle,
                                color: Colors.white),
                            duration: Duration(seconds: 3),
                            overlayColor: Colors.black54,
                            barBlur: 50,
                            boxShadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 4),
                              ),
                            ],
                          );
                        },
                        child: Text('Order Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                          shadowColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToppingOption(String flavor, String imageAsset) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 1, top: 2),
      child: Column(
        children: [
          Text('choose more:'),
          Row(
            children: [

              IconButton(
                icon: Icon(Icons.add_circle_outlined, color: Colors.green, size: 22),
                onPressed: () {
                  controller.addTopping(flavor);
                },
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.contain,
                    width: 60,
                    height: 70,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_sharp, color: Colors.red, size: 22),
                onPressed: () {
                  controller.removeTopping(flavor);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}