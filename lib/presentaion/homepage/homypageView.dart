import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icecreamappgetx/data/models/detailPage_model.dart';
import 'package:icecreamappgetx/presentaion/detailpage/detailpageView.dart';
import 'package:icecreamappgetx/presentaion/homepage/homepage_controller.dart';

class HomePage extends StatelessWidget {
  final FavoriteController controller = Get.put(FavoriteController(3));
  final HomePageController homeController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(width: 10.0),
              Container(
                height: 50,
                width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('asset/happyface.png'),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Discover Flavor',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('asset/happyface.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade100, Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'Click to search..',
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Rounded corners
                    borderSide: BorderSide(
                      color: Colors.transparent, // No border color
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent), // No border color for normal state
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent), // No border color when focused
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0), // Space between icon and text
                    child: Icon(Icons.search, color: Colors.black), // Search icon
                  ),
                ),
                onChanged: (value) {

                },
              ),
            ),
            SizedBox(height: 10),

            CarouselSlider.builder(
              itemCount: homeController.homeModel.flavorImages.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      homeController.homeModel.flavorImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
              ),
            ),
            //SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Most',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Popular',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade300
                        ),
                      ),
                      Text(
                        ' Cones',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 80),
                      IconButton(
                       icon: Icon(Icons.arrow_forward, color: Colors.black), // Your icon here
                      onPressed: () {
                      }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Three items per row
                  childAspectRatio: 0.8, // Aspect ratio for grid items
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: homeController.homeModel.sliderImages.length,
                itemBuilder: (context, index) {
                  final imageUrl = homeController.homeModel.sliderImages[index]; // Cycle through assets
                  final priceUrl = homeController.homeModel.priceUrls[index];
                  //final iceCream = homeModel.iceCreams[index];// Corresponding price URL
                  List<Color> backgroundColors = [
                    Colors.purple.shade100,
                    Colors.orange.shade100,
                    Color(0xFFFFB4D2),
                  ];
                  Color backgroundColor = backgroundColors[index % backgroundColors.length];
                  return SizedBox(
                    width: 140,
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: backgroundColor,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10), // Adjusted padding
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: SizedBox.shrink(),
                                ),
                                SizedBox(height: 90),
                                Text(
                                  homeController.homeModel.sliderTexts[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                                Text(
                                  priceUrl,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          // Background Image
                          Positioned(
                            top: -60,
                            left: 30,
                            right: 0,
                            child: Container(
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 70,
                            child: Obx(() => IconButton(
                              icon: Icon(
                                controller.isFavoriteList[index]
                                    ? Icons.favorite
                                    : Icons.favorite_outline_rounded,
                                color: controller.isFavoriteList[index]
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleFavorite(index),
                            )),
                          ),

                          Positioned(
                            top: 110,
                            right: -10,
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                IceCream selectedIceCream = homeController.homeModel.iceCreams[index]; // Get the selected ice cream
                                Get.to(() => IceCreamDetailPage(iceCream: selectedIceCream)); // Pass the selected ice cream to the detail page
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Most',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Popular',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade300
                        ),
                      ),
                      Text(
                        ' Cones',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 80),
                      IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.black), // Your icon here
                          onPressed: () {
                         }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //childAspectRatio: 0.8,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: (230 / 200),
                ),
                itemCount: homeController.homeModel.sliderImages2.length,
                itemBuilder: (context, index) {
                  final imageUrl2 = homeController.homeModel.sliderImages2[index];
                  final priceUrl2 = homeController.homeModel.priceUrls2[index];
                  List<Color> backgroundColors = [
                    Colors.yellow.shade100,
                    Colors.cyan.shade50,
                    Colors.greenAccent.shade100,
                  ];
                  Color backgroundColor = backgroundColors[index % backgroundColors.length];
                  return SizedBox(
                    width: 100,
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: backgroundColor,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: SizedBox.shrink(),
                                ),
                                SizedBox(height: 50),
                                Text(
                                  homeController.homeModel.sliderTexts2[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                                Text(
                                  priceUrl2,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          // Background Image
                          Positioned(
                            top: -90,
                            left: 10,
                            right: 0,
                            child: Container(
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(imageUrl2),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Day',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Offers',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade300
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: homeController.homeModel.offers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          // Image
                          Image.asset(
                            homeController.homeModel.offers[index]['image']!,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          // Overlay
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeController.homeModel.offers[index]['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  homeController.homeModel.offers[index]['description']!,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ));
  }}