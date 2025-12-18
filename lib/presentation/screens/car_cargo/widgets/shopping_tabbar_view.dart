import 'package:flutter/material.dart';
import 'package:yuu_sell/presentation/widgets/shopping_card.dart';

class ShoppingTabbarView extends StatelessWidget {
  ShoppingTabbarView({super.key});

  final List<String> mockLogos = [
    'assets/images/aliexpress.png',
    'assets/images/amazon.png',
    'assets/images/ebay.png',
    'assets/images/ozon.png',
    'assets/images/shopify.png',
  ];
  
  final List<String> mockTitles = [
    'Copart',
    'IAAI',
    'MENHEIM',
    'EDGEPIPELINE',
    'SALVAGENOW',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < mockLogos.length; i++)
          ShoppingCard(
            title: mockTitles[i],
            description: 'One-stop shop for fashion, gadgets, home & hobby items. Great deals, fast delivery.',
            date: '',
            imageUrl: mockLogos[i],
          ),
      ],
    );
  }
}
