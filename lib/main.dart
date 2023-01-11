import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/splash_screen.dart';
import 'package:tic_tac_toe/data/x_o_data_hub.dart';

import 'front_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => XOModelData()..loadXODataList(),
        ),
      ],
      child: const MaterialApp(
        title: 'Tic Tac Toe',
        debugShowCheckedModeBanner: false,
        home: FrontScreen(),
      ),
    );
  }
}
