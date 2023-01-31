import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NeutrtionIndicators extends StatelessWidget {
  final String label;
  final int consume;
  final int total;
  final Color color;
  const NeutrtionIndicators({
    Key? key,
    required this.label,
    required this.consume,
    required this.total,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 3),
          child: Text("$label - $consume/$total g",
              style: const TextStyle(fontSize: 12, color: Colors.white70)),
        ),
        const SizedBox(
          height: 2,
        ),
        LinearPercentIndicator(
            animation: true,
            lineHeight: 6.0,
            width: 100,
            animationDuration: 1000,
            percent: consume > total ? 1 : (consume / total),
            barRadius: const Radius.circular(50),
            progressColor: consume > total ? Colors.red : color),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
