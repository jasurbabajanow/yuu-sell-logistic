import 'package:flutter/material.dart';
import 'package:yuu_sell/presentation/widgets/shopping_card.dart';

class NewsTabbarView extends StatelessWidget {
  NewsTabbarView({super.key});

  final List<String> mockTitles = [
    'Open Sea cargo',
    'Open Sea cargo',
    'Open Sea cargo',
    'Open Sea cargo',
    'Open Sea cargo',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < mockTitles.length; i++)
          ShoppingCard(
            title: mockTitles[i],
            description: 'The fastest delivery solution for urgent, high-value cargo. Choose from 50+ carriers, get real-time quotes, and ensure 4–5 day global transit times.',
            date: '',
            imageUrl: 'assets/images/news.png',
          ),
      ],
    );
  }
}