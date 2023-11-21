import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';


class startScreen extends StatelessWidget {
  static String id = 'start';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var lang = CacheHelper.getData(key: 'lang');

        return Scaffold(
          appBar: AppBar(
          //  automaticallyImplyLeading: false,
         //   backgroundColor: HexColor("#6A9C89"),
            title:  Center(
              child: Text(

                S.of(context).title,
                //'your movies',

                style: GoogleFonts.openSans(
                textStyle: (lang=='en')?

                TextStyle(
                  fontSize: 16,

                ):
                TextStyle(
                  fontSize: 20,

                  fontWeight: FontWeight.bold,
                )
              ),
            )),
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_4_outlined,
               //   color: Colors.black,
                ),
                onPressed: () {
                  cubit.changeMode();

                },
              ),
              IconButton(
                icon: Icon(Icons.language,
              //    color: Colors.black,
                ),
                onPressed: () {
                  cubit.toggleLanguage();

                  cubit.getNowPlaying();
                  cubit.getTrend();
                  cubit.getTopRated();
                  cubit.getUpComing();
                },
              ),

            ],

          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              if (connectivity == ConnectivityResult.none) {

                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'تأكد من وجود انترنت',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              } else {

                return cubit.getCurrentScreen();
              }
            },
            child: const SizedBox(),
          ),
        );
      },
    );
  }
}