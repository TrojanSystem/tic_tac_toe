import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/splash_screen.dart';

import 'data/x_o_data_hub.dart';

Center buildWinNotifier(whoWin, context, lottie, isAwin, isShowing, height) {
  return Center(
    child: SizedBox(
      width: 300,
      height: 220,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(66, 90, 94, 1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(34, 50, 50, 1),
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: Offset(10, 10)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/images/$lottie',
                    fit: BoxFit.contain, width: 180, height: height),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      isShowing
                          ? Text(
                              whoWin,
                              style: const TextStyle(
                                  fontFamily: 'FredokaOne',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30),
                            )
                          : Container(),
                      Text(
                        isAwin,
                        style: const TextStyle(
                            fontFamily: 'FredokaOne',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 35),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SplashScreen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        color: const Color.fromRGBO(5, 140, 254, 1),
                        shape: BoxShape.circle),
                    width: 50,
                    height: 50,
                    child:
                        const Icon(Icons.menu, color: Colors.white, size: 35),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<XOModelData>(context, listen: false)
                      .deleteXODataList();
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        color: const Color.fromRGBO(5, 140, 254, 1),
                        shape: BoxShape.circle),
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.refresh_outlined,
                        color: Colors.white, size: 40),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
