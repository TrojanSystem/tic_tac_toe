import 'package:flutter/material.dart';
import 'package:tic_tac_toe/player_side/x_letter.dart';

import 'choose_player.dart';
import 'player_side/o_letter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 77, 77, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                XLetter(itemColor: const Color.fromRGBO(254, 202, 40, 1)),
                const SizedBox(
                  width: 50,
                ),
                OLetter(
                    innerItemColor: const Color.fromRGBO(255, 77, 77, 1),
                    outerItemColor: const Color.fromRGBO(254, 202, 40, 1)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ChoosePlayer()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 202, 40, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Start',
                    style: TextStyle(
                        fontFamily: 'FredokaOne',
                        color: Color.fromRGBO(255, 77, 77, 1),
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
