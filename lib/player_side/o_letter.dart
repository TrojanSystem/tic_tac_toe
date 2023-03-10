import 'package:flutter/material.dart';

class OLetter extends StatelessWidget {
  OLetter({required this.innerItemColor, required this.outerItemColor});

  Color innerItemColor;
  Color outerItemColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                color: outerItemColor,
                shape: BoxShape.circle),
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: innerItemColor,
                  shape: BoxShape.circle),
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
