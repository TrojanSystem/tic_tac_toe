import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:tic_tac_toe/data/x_o_data_hub.dart';
import 'package:tic_tac_toe/data/x_o_model.dart';
import 'package:tic_tac_toe/player_side/o_letter.dart';
import 'package:tic_tac_toe/player_side/x_letter.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key, required this.turn});

  String turn;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool isTapped = false;
  late int current_index = -1;

  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<XOModelData>(context).xoDataList;
    double w = MediaQuery.of(context).size.width;
    final char = gameData.map((e) => e.padNumber).toList();

    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("Turn: ${widget.turn}"),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<XOModelData>(context,listen: false).deleteXODataList();
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Turn: ${widget.turn}'),
            ),
          ),
          Expanded(
            flex: 4,
            child: buildPlayingBoard(w, columnCount, char, gameData),
          ),
        ],
      ),
    );
  }

  Stack buildPlayingBoard(double w, int columnCount, data, gameData) {
    return Stack(
      children: [
        AnimationLimiter(
          child: GridView.count(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(w / 60),
            crossAxisCount: columnCount,
            children: [
              data.contains(0)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(0)
                          ? ''
                          : gameData[data.indexOf(0)].playerSide)
                  : buildPad(columnCount, w, 0),
              data.contains(1)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(1)
                          ? ''
                          : gameData[data.indexOf(1)].playerSide)
                  : buildPad(columnCount, w, 1),
              data.contains(2)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(2)
                          ? ''
                          : gameData[data.indexOf(2)].playerSide)
                  : buildPad(columnCount, w, 2),
              data.contains(3)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(3)
                          ? ''
                          : gameData[data.indexOf(3)].playerSide)
                  : buildPad(columnCount, w, 3),
              data.contains(4)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(4)
                          ? ''
                          : gameData[data.indexOf(4)].playerSide)
                  : buildPad(columnCount, w, 4),
              data.contains(5)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(5)
                          ? ''
                          : gameData[data.indexOf(5)].playerSide)
                  : buildPad(columnCount, w, 5),
              data.contains(6)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(6)
                          ? ''
                          : gameData[data.indexOf(6)].playerSide)
                  : buildPad(columnCount, w, 6),
              data.contains(7)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(7)
                          ? ''
                          : gameData[data.indexOf(7)].playerSide)
                  : buildPad(columnCount, w, 7),
              data.contains(8)
                  ? buildPressedPad(
                      columnCount,
                      w,
                      !data.contains(8)
                          ? ''
                          : gameData[data.indexOf(8)].playerSide)
                  : buildPad(columnCount, w, 8),
            ],
          ),
        ),
      ],
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
                  color: Colors.red,
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
              final test =
                  Provider.of<XOModelData>(context, listen: false).xoDataList;
            },
            child: Container(
              margin:
                  EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
              decoration: BoxDecoration(
                color: Colors.red,
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
                    ? XLetter(itemColor: Colors.blue)
                    : OLetter(
                        innerItemColor: const Color.fromRGBO(254, 202, 40, 1),
                        outerItemColor: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
