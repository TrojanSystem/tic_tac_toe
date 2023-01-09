import 'package:flutter/material.dart';

class XLetter extends StatelessWidget {
   XLetter({required this.itemColor});
Color itemColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Transform.rotate(
            angle: -40,
            child: Container(
              decoration: BoxDecoration(
                color:itemColor,
                borderRadius: BorderRadius.circular(8)
              ),
              width: 30,
              height: 140,
             
            ),
          ),
          Transform.rotate(
            angle: 40,
            child: Container(
              width: 30,
              height: 140,
              decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
