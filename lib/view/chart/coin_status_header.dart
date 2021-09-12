import 'package:flutter/material.dart';

class CoinStatusHeader extends StatelessWidget {
  final double currentPrice;
  final double detailChange;
  final double percentChange;

  const CoinStatusHeader({
    Key? key,
    required this.currentPrice,
    required this.detailChange,
    required this.percentChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$$currentPrice',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$detailChange'),
              const SizedBox(width: 12),
              Text(
                '($percentChange%)',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          )
        ],
      );
}
