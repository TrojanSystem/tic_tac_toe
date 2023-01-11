import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/brain/choose_player.dart';
import 'package:tic_tac_toe/brain/game_board.dart';
import 'package:tic_tac_toe/data/x_o_data_hub.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  Widget build(BuildContext context) {
    final isLoaded = Provider.of<XOModelData>(context);
    final gameData = Provider.of<XOModelData>(context).xoDataList;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/splash.jpg'),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black),
                color: const Color.fromRGBO(70, 97, 113, 1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Tic Tac Toe',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'FredokaOne',
                    ),
                  ),
                  buildButtons(context, 'NEW GAME', 'NEW GAME', isLoaded),
                  gameData.isNotEmpty
                      ?  buildButtons(
                              context, 'CONTINUE', 'CONTINUE', isLoaded)
                          : Container()
                      ,
                  buildButtons(context, 'EXIT', 'EXIT', isLoaded),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildButtons(
      BuildContext context, order, isNewGame, isLoaded) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isNewGame == 'NEW GAME') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const ChoosePlayer(),
              ),
            );
          } else if (isNewGame == 'CONTINUE') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => GameBoard(turn: isLoaded.selectedSide),
              ),
            );
          } else if (isNewGame == 'EXIT') {}
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(5, 140, 254, 1),
          border: Border.all(width: 5, color: Colors.white),
        ),
        child: Center(
          child: Text(
            order,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'FredokaOne',
            ),
          ),
        ),
      ),
    );
  }
}
