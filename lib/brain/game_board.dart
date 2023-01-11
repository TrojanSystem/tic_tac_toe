import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:tic_tac_toe/data/x_o_data_hub.dart';
import 'package:tic_tac_toe/data/x_o_model.dart';
import 'package:tic_tac_toe/front_screen.dart';
import 'package:tic_tac_toe/player_side/o_letter.dart';
import 'package:tic_tac_toe/player_side/x_letter.dart';

import '../winner_board.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key, required this.turn});

  String turn;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Do you want to exit an App',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    int count = 0;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => const FrontScreen(),
                      ),
                    );
                    Provider.of<XOModelData>(context,listen: false).loader();
                  });
                },
                child: const Text('Yes'),
              ),
            ],
            backgroundColor: Colors.black.withOpacity(0.3),
          ),
        )) ??
        false;
  }

  bool isTapped = false;
  bool isWin = false;
  bool isDrawn = false;
  late int current_index = -1;

  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<XOModelData>(context).xoDataList;
    double w = MediaQuery.of(context).size.width;
    final char = gameData.map((e) => e.padNumber).toList();

    int columnCount = 3;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(34, 50, 76, 1).withOpacity(0.8),
          elevation: 0,
          title: const Text(
            "Tic Tac Toe",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/b.jpg',
                  ),
                ),
              ),
            ),
            buildPlayerBoard(w, columnCount, char, gameData, context),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Are you sure?',
                  style: TextStyle(color: Colors.white),
                ),
                content: const Text(
                  'Do you want to restart the game?',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(false), //<-- SEE HERE
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<XOModelData>(context, listen: false)
                          .deleteXODataList();
                      Navigator.of(context).pop(false);
                    },
                    // <-- SEE HERE
                    child: const Text('Yes'),
                  ),
                ],
                backgroundColor: Colors.black.withOpacity(0.3),
              ),
            );
          },
          backgroundColor: const Color.fromRGBO(74, 156, 199, 1),
          child: const Icon(
            Icons.refresh_outlined,
            size: 35,
          ),
        ),
      ),
    );
  }

  Stack buildPlayerBoard(double w, int columnCount, List<int> char,
      List<XOModel> gameData, BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: buildPlayingBoard(w, columnCount, char, gameData),
            ),
          ],
        ),
        gameData.isEmpty
            ? Container()
            : (char.contains(0) &&
                        char.contains(1) &&
                        char.contains(2) &&
                        gameData[char.indexOf(0)].playerSide == 'o' &&
                        gameData[char.indexOf(1)].playerSide == 'o' &&
                        gameData[char.indexOf(2)].playerSide == 'o') ||
                    (char.contains(3) &&
                        char.contains(4) &&
                        char.contains(5) &&
                        gameData[char.indexOf(3)].playerSide == 'o' &&
                        gameData[char.indexOf(4)].playerSide == 'o' &&
                        gameData[char.indexOf(5)].playerSide == 'o') ||
                    (char.contains(6) &&
                        char.contains(7) &&
                        char.contains(8) &&
                        gameData[char.indexOf(6)].playerSide == 'o' &&
                        gameData[char.indexOf(7)].playerSide == 'o' &&
                        gameData[char.indexOf(8)].playerSide == 'o') ||
                    (char.contains(2) &&
                        char.contains(4) &&
                        char.contains(6) &&
                        gameData[char.indexOf(2)].playerSide == 'o' &&
                        gameData[char.indexOf(4)].playerSide == 'o' &&
                        gameData[char.indexOf(6)].playerSide == 'o') ||
                    (char.contains(0) &&
                        char.contains(4) &&
                        char.contains(8) &&
                        gameData[char.indexOf(0)].playerSide == 'o' &&
                        gameData[char.indexOf(4)].playerSide == 'o' &&
                        gameData[char.indexOf(8)].playerSide == 'o') ||
                    (char.contains(0) &&
                        char.contains(3) &&
                        char.contains(6) &&
                        gameData[char.indexOf(0)].playerSide == 'o' &&
                        gameData[char.indexOf(3)].playerSide == 'o' &&
                        gameData[char.indexOf(6)].playerSide == 'o') ||
                    (char.contains(2) &&
                        char.contains(5) &&
                        char.contains(8) &&
                        gameData[char.indexOf(2)].playerSide == 'o' &&
                        gameData[char.indexOf(5)].playerSide == 'o' &&
                        gameData[char.indexOf(8)].playerSide == 'o') ||
                    (char.contains(0) &&
                        char.contains(1) &&
                        char.contains(2) &&
                        gameData[char.indexOf(0)].playerSide == 'x' &&
                        gameData[char.indexOf(1)].playerSide == 'x' &&
                        gameData[char.indexOf(2)].playerSide == 'x') ||
                    (char.contains(3) &&
                        char.contains(4) &&
                        char.contains(5) &&
                        gameData[char.indexOf(3)].playerSide == 'x' &&
                        gameData[char.indexOf(4)].playerSide == 'x' &&
                        gameData[char.indexOf(5)].playerSide == 'x') ||
                    (char.contains(6) &&
                        char.contains(7) &&
                        char.contains(8) &&
                        gameData[char.indexOf(6)].playerSide == 'x' &&
                        gameData[char.indexOf(7)].playerSide == 'x' &&
                        gameData[char.indexOf(8)].playerSide == 'x') ||
                    (char.contains(2) &&
                        char.contains(4) &&
                        char.contains(6) &&
                        gameData[char.indexOf(2)].playerSide == 'x' &&
                        gameData[char.indexOf(4)].playerSide == 'x' &&
                        gameData[char.indexOf(6)].playerSide == 'x') ||
                    (char.contains(0) &&
                        char.contains(4) &&
                        char.contains(8) &&
                        gameData[char.indexOf(0)].playerSide == 'x' &&
                        gameData[char.indexOf(4)].playerSide == 'x' &&
                        gameData[char.indexOf(8)].playerSide == 'x') ||
                    (char.contains(0) &&
                        char.contains(3) &&
                        char.contains(6) &&
                        gameData[char.indexOf(0)].playerSide == 'x' &&
                        gameData[char.indexOf(3)].playerSide == 'x' &&
                        gameData[char.indexOf(6)].playerSide == 'x') ||
                    (char.contains(2) &&
                        char.contains(5) &&
                        char.contains(8) &&
                        gameData[char.indexOf(2)].playerSide == 'x' &&
                        gameData[char.indexOf(5)].playerSide == 'x' &&
                        gameData[char.indexOf(8)].playerSide == 'x')
                ? buildWinNotifier(
                    widget.turn, context, 'star-3.json', 'WIN', true, 85.0)
                : gameData.length > 7
                    ? buildWinNotifier(widget.turn, context, 'drawn.json',
                        'DRAWN', false, 120.0)
                    : Container()
      ],
    );
  }

  AnimationLimiter buildPlayingBoard(
      double w, int columnCount, data, gameData) {
    return AnimationLimiter(
      child: GridView.count(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(w / 60),
        crossAxisCount: columnCount,
        children: [
          data.contains(0)
              ? buildPressedPad(columnCount, w,
                  !data.contains(0) ? '' : gameData[data.indexOf(0)].playerSide)
              : buildPad(columnCount, w, 0),
          data.contains(1)
              ? buildPressedPad(columnCount, w,
                  !data.contains(1) ? '' : gameData[data.indexOf(1)].playerSide)
              : buildPad(columnCount, w, 1),
          data.contains(2)
              ? buildPressedPad(columnCount, w,
                  !data.contains(2) ? '' : gameData[data.indexOf(2)].playerSide)
              : buildPad(columnCount, w, 2),
          data.contains(3)
              ? buildPressedPad(columnCount, w,
                  !data.contains(3) ? '' : gameData[data.indexOf(3)].playerSide)
              : buildPad(columnCount, w, 3),
          data.contains(4)
              ? buildPressedPad(columnCount, w,
                  !data.contains(4) ? '' : gameData[data.indexOf(4)].playerSide)
              : buildPad(columnCount, w, 4),
          data.contains(5)
              ? buildPressedPad(columnCount, w,
                  !data.contains(5) ? '' : gameData[data.indexOf(5)].playerSide)
              : buildPad(columnCount, w, 5),
          data.contains(6)
              ? buildPressedPad(columnCount, w,
                  !data.contains(6) ? '' : gameData[data.indexOf(6)].playerSide)
              : buildPad(columnCount, w, 6),
          data.contains(7)
              ? buildPressedPad(columnCount, w,
                  !data.contains(7) ? '' : gameData[data.indexOf(7)].playerSide)
              : buildPad(columnCount, w, 7),
          data.contains(8)
              ? buildPressedPad(columnCount, w,
                  !data.contains(8) ? '' : gameData[data.indexOf(8)].playerSide)
              : buildPad(columnCount, w, 8),
        ],
      ),
    );
  }

  AnimationConfiguration buildPad(int columnCount, double w, index) {
    return AnimationConfiguration.staggeredGrid(
      position: 0,
      duration: const Duration(milliseconds: 500),
      columnCount: columnCount,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  current_index = index;

                  if (widget.turn == 'x') {
                    setState(() {
                      widget.turn = 'o';
                    });
                  } else if (widget.turn == 'o') {
                    setState(() {
                      widget.turn = 'x';
                    });
                  }
                });
                final xoData = XOModel(
                    padNumber: current_index,
                    playerSide: widget.turn,
                    playerIcon: widget.turn);
                Provider.of<XOModelData>(context, listen: false)
                    .addXODataList(xoData);
                final test =
                    Provider.of<XOModelData>(context, listen: false).xoDataList;
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: w / 30, left: w / 60, right: w / 60),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(70, 97, 113, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  AnimationConfiguration buildPressedPad(int columnCount, double w, turn) {
    return AnimationConfiguration.staggeredGrid(
      position: 0,
      duration: const Duration(milliseconds: 500),
      columnCount: columnCount,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (widget.turn == 'x') {
                  setState(() {
                    widget.turn = 'o';
                  });
                } else if (widget.turn == 'o') {
                  setState(() {
                    widget.turn = 'x';
                  });
                }
              });
              final xoData = XOModel(
                  padNumber: current_index,
                  playerSide: widget.turn,
                  playerIcon: widget.turn);
              Provider.of<XOModelData>(context, listen: false)
                  .addXODataList(xoData);
            },
            child: Container(
              margin:
                  EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(70, 97, 113, 1),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: turn == 'x'
                    ? XLetter(itemColor: const Color.fromRGBO(228, 92, 209, 1))
                    : OLetter(
                        innerItemColor: const Color.fromRGBO(70, 97, 113, 1),
                        outerItemColor: const Color.fromRGBO(74, 156, 199, 1),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
