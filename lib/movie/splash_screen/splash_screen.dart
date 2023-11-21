//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lottie/lottie.dart';
// import 'package:movie_app/core/app_colors.dart';
//
// import '../home_screen/view/screens/start_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => startScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//        //     Spacer(flex: 3),
//             Lottie.asset('assets/images/movie_splash.json'),
//
//           /*  SvgPicture.asset(
//               'assets/img/newsplash.svg',
//               width: 200,
//               height: 200,
//             ),*/
//             Text(
//               'Enjoy your favourite movies',
//               textAlign: TextAlign.center, // Center-align the text
//
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color:AppColors.primaryColor,
//
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../core/app_colors.dart';
import '../home_screen/view/screens/start_screen.dart';


import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    startScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:  Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            //border: Border.all(width: 20),
            //borderRadius: BorderRadius.circular(20),
          ),
          child:Column(
            children: [
              Spacer(flex: 3,),
              SizedBox(
                height: 200.h,
                width: 200.w,
                child:           Lottie.asset('assets/images/movie_animation.json'),


              ),
              SizedBox(
                height: 50.sp,
              ),
              Text(
                'M o v i e s    w o r l d',
                style: TextStyle(
                  fontStyle: FontStyle.italic,

                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
              //    color:Colors.white,
                ),
              ),
              Spacer(flex: 3,),
            ],
          )
      ),
    );
  }
}