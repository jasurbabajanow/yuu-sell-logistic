import 'package:flutter/widgets.dart';
import 'package:yuu_sell/presentation/widgets/shopping_card.dart';

class DiscountsTabbarView extends StatelessWidget {
  const DiscountsTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 5; i++)
          ShoppingCard(
            title: 'Autumn Surprise: XBOX Giveaway',
            description: 'Winner revealed Oct 1, 2025 - follow us on social media to stay tuned. ',
            date: '18.08.2025',
            imageUrl: 'assets/images/xbox.png',
          ),
      ],
    );
  }
}