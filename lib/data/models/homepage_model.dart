import 'package:icecreamappgetx/data/models/detailPage_model.dart';

class HomeModel {
  final List<String> flavorImages = [
    'asset/str2.png',
    'asset/french-bakery.jpeg',
    'asset/milk3.jpg',
    'asset/cake10.png',
    'asset/bakery.jpg',
    'asset/cake7.jpeg',
    'asset/cake11.jpg',
  ];

  final List<String> sliderImages = [
    'asset/purple cons.png',
    'asset/chococones.png',
    'asset/pinkcones.png',
  ];

  final List<String> sliderImages2 = [
    'asset/whitedonat.png',
    'asset/donatchoco.png',
    'asset/pink2donat.png',
  ];

  final List<String> sliderTexts = [
    'blueberry',
    'Chocolate',
    'Strawberry',
  ];

  final List<String> sliderTexts2 = [
    'vanilla',
    'Chocolate',
    'Strawberry',
  ];

  List<String> priceUrls = [
    '500\$',
    '680\$',
    '680\$',
  ];

  List<String> priceUrls2 = [
    '500\$',
    '680\$',
    '680\$',
  ];

  final List<Map<String, String>> offers = [
    {
      'title': 'Mothers Day Treats 20%',
      'description': 'Delicious chocolate cake with rich frosting.',
      'image': 'asset/offers4.png',
    },
    {
      'title': 'Flavorful Festivities 50%',
      'description': 'Light and fluffy vanilla cake.',
      'image': 'asset/offers3.png',
    },
    {
      'title': 'Sweet Celebration Treats 15%',
      'description': 'Light and fluffy vanilla cake.',
      'image': 'asset/offers6.jpg',
    },
    {
      'title': 'Teacher Day 5%',
      'description': 'Light and fluffy vanilla cake.',
      'image': 'asset/خببثق7.jpg',
    },
  ];
  final List<IceCream> iceCreams = [
    IceCream(
      flavor: 'Purple',
      image: 'asset/purple cons.png',
      description: 'Delicious purple ice cream with hints of berry.',
      rating: 4.5,
    ),
    IceCream(
      flavor: 'Chocolate',
      image: 'asset/chococones.png',
      description: 'Rich and creamy chocolate ice cream.',
      rating: 4.8,
    ),
    IceCream(
      flavor: 'Strawberry',
      image: 'asset/pinkcones.png',
      description: 'Delicious strawberry ice cream with fresh strawberries.',
      rating: 4.7,
    ),
  ];
}