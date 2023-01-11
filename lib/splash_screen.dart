// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import 'brain/choose_player.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('assets/images/splash.jpg'),
//             ),
//           ),
//         ),
//         Scaffold(
//           //backgroundColor: const Color.fromRGBO(255, 77, 77, 1),
//           backgroundColor: Colors.transparent, extendBodyBehindAppBar: true,
//           body: Container(
//             color: Colors.transparent,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Lottie.asset('assets/images/tic.json'),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (ctx) => const ChoosePlayer()),
//                         );
//                       },
//                       child: Container(
//                         width: 150,
//                         height: 60,
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(254, 202, 40, 1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: const Center(
//                           child: Text(
//                             'Start',
//                             style: TextStyle(
//                                 fontFamily: 'FredokaOne',
//                                 color: Color.fromRGBO(255, 77, 77, 1),
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 25),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
