import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/data/x_o_model.dart';
import 'package:tic_tac_toe/brain/game_board.dart';
import 'package:tic_tac_toe/player_side/o_letter.dart';
import 'package:tic_tac_toe/player_side/x_letter.dart';
import 'package:tic_tac_toe/data/x_o_data_hub.dart';

class ChoosePlayer extends StatefulWidget {
  const ChoosePlayer({Key? key}) : super(key: key);

  @override
  State<ChoosePlayer> createState() => _ChoosePlayerState();
}

class _ChoosePlayerState extends State<ChoosePlayer> {
  bool _isTapped = false;
  String selectedSide = '';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 77, 77, 1),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(254, 202, 40, 1),
                    fontSize: 25,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTapped = !_isTapped;
                        if (_isTapped) {
                          selectedSide = 'x';
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => GameBoard(turn: selectedSide),
                            ),
                          );
                        } else {
                          selectedSide = 'x';
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => GameBoard(turn: selectedSide),
                            ),
                          );
                        }
                      });


                    },
                    child: _isTapped
                        ? XLetter(
                            itemColor: const Color.fromRGBO(254, 202, 40, 1),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 202, 40, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: XLetter(
                              itemColor: const Color.fromRGBO(255, 77, 77, 1),
                            ),
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTapped = !_isTapped;
                        if (_isTapped) {
                          selectedSide = 'o';
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => GameBoard(turn: selectedSide),
                            ),
                          );
                        } else {
                          selectedSide = 'o';
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => GameBoard(turn: selectedSide),
                            ),
                          );
                        }
                      });


                    },
                    child: _isTapped
                        ? Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 202, 40, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: OLetter(
                              outerItemColor: const Color.fromRGBO(255, 77, 77, 1),
                              innerItemColor: const Color.fromRGBO(254, 202, 40, 1),
                            ))
                        : OLetter(
                            outerItemColor: const Color.fromRGBO(254, 202, 40, 1),
                            innerItemColor: const Color.fromRGBO(255, 77, 77, 1),
                          ),
                  ),
                ),
              ),
            ],
          ),


    );
  }
}
