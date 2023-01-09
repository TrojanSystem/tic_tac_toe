import 'package:flutter/cupertino.dart';

class XOModel {
  int padNumber;
  String playerSide;
  String playerIcon;

  XOModel(
      {required this.padNumber,
      required this.playerSide,
      required this.playerIcon});

  Map<String, dynamic> toMap() {
    return {
      'padNumber': padNumber,
      'playerSide': playerSide,
      'playerIcon': playerIcon,
    };
  }

  static XOModel fromMap(Map<String, dynamic> map) {
    return XOModel(
      padNumber: map['padNumber'],
      playerSide: map['playerSide'],
      playerIcon: map['playerIcon'],
    );
  }
}
