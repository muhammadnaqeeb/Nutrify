import 'package:flutter/material.dart';

class WorkList extends StatelessWidget {
  final String title;
  final Icon icon;
  VoidCallback ontap;
  WorkList(
      {Key? key, required this.title, required this.icon, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xFF000000),
                  borderRadius: BorderRadius.circular(14)),
              child: icon,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(title)
          ],
        ),
        InkWell(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.navigate_next_rounded),
          ),
        ),
      ],
    );
  }
}
