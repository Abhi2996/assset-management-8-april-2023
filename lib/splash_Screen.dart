import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:my_app/Screens/LoginForm.dart';

import 'login .dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// const TextStyle textStyle = TextStyle(
//   color: Colors.white,
//   fontFamily: 'Calligraffitti',
// );

class _SplashScreenState extends State<SplashScreen> {
  // final greenOpacity = Container(
  //   color: Color(0xAA6FFFB0CF),
  // );
  
  final background = Container(
    
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/background.jpeg'),
        fit: BoxFit.cover,
      ),
    ),
  );

  
  @override
  //syntax error
  //void initstate()
  //s was small
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyLogin(),
        ),
      );
    });
  }

  //animation<double> animation;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     duration: Duration(milliseconds: 2000),
  //     vsync: this,
  //   );

  //   animation = Tween(begin: 0.0, end: 1.0).animate(controller)
  //     ..addListener(() {
  //       setState(() {});
  //     });

  //   controller.forward();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }



 

  // final logo = ScaleTransition(
  //   scale: animation,
  //   child: Image.asset(
  //     'assets/logo1.png',
  //     width: 200.0,
  //     height: 190.0,
  //   ),
  // );

  // static get textStyle => null;

  // final description = Text(
  //   'Get a update record on fixed assets of the Company.',
  //   textAlign: TextAlign.center,
  //   style: textStyle.copyWith(fontSize: 24.0),
  // );

  // Widget button(String label, Function onTap) {
  //   return Material(
  //     color: Color.fromARGB(184, 155, 172, 151),
  //     borderRadius: BorderRadius.circular(30.0),
  //     child: InkWell(
  //       //onTap: onTap,
  //       splashColor: Colors.white24,
  //       highlightColor: Colors.white10,
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 13.0),
  //         child: Center(
  //           child: Text(
  //             label,
  //             //  style: textStyle.copyWith(fontSize: 8.0)
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  final separator = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          width: 20.0, height: 2.0, color: Color.fromARGB(255, 74, 67, 59)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'OR',
          
        ),
      ),
      Container(
          width: 20.0, height: 2.0, color: Color.fromARGB(255, 81, 74, 66)),
    ],
  );

  // final signWith = Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: <Widget>[
  //     Text('Sign in wth', style: textStyle,),
  //     GestureDetector(
  //       onTap: () {print('google');},
  //       child: Text(
  //         ' Google',

  //           // Color: Color(0xBB009388),
  //           // FontWeight:FontWeight.bold,
  //           // Decoration:TextDecoration.underline

  //       ),
  //     ),
  //   ],);
  // final signWith = Row(
  //   //opacity: animation,

  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: <Widget>[
  //     Text(
  //       'Sign in with',
  //       style: textStyle,
  //     ),
  //     GestureDetector(
  //       onTap: () {
  //         print('google');
  //       },
  //       child: Text(
  //         ' Google',

  //         ///decoration: TextDecoration.underline),
  //       ),
  //     ),
  //     GestureDetector(
  //       onTap: () {
  //         print('Facebook');
  //       },
  //       child: Text(
  //         ' OR Facebook',
  //         // style: textStyle.copyWith(
  //         //     color: Color(0xBB009388),
  //         //     fontWeight: FontWeight.bold,
  //         //     decoration: TextDecoration.underline),
  //       ),
  //     ),
  //   ],
  // );
  @override
  Widget build(BuildContext context) {
    final greenOpacity = Container(
    color: Color(0xAA6FFFB0CF),
  );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final logo = Image.asset(
      'assets/logo2.png',
      width: 1260.0,
      height: 470.0,
    );

    //@override
    //Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           background,
//           greenOpacity,
//           new SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   logo,
//                   SizedBox(
//                     height: 130.0,
//                   ),
//                   // description,
//                   button('Create a Account', () {
//                     print('account');
//                   }),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   button('Sign In', () {
//                     print('sign in');
//                   }),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   separator,
//                   SizedBox(
//                     height: 30.0,
//                   ),

//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          greenOpacity,
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  logo,
                  SizedBox(height: 30.0)
                  // SizedBox(height: 60.0),
                  // button('Create account', () {
                  //   print('account');
                  //   onPressed: () {
                  //          Navigator.pushNamed(context, 'CreateAcc');
                  //           };
                  // }),
                  // SizedBox(height: 8.0),
                  // button('Sign In', () {
                  //   print('sign in');
                  // }),
                  // SizedBox(height: 30.0),
                  // separator,
                  // SizedBox(height: 30.0),
                  // signWith
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
