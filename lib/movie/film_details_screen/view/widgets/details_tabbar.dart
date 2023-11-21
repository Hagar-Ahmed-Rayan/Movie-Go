import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie/film_details_screen/view/widgets/review_list.dart';
import 'package:movie_app/movie/home_screen/view/widgets/up_coming_movies.dart';

import '../../../../generated/l10n.dart';
import '../../../home_screen/view_model/home_cubit.dart';
import '../../../home_screen/view_model/home_state.dart';



class DetailsTabbar extends StatelessWidget {
  const DetailsTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return  SizedBox(
          height: 277.h,
          //  width: 300,
          child:DefaultTabController(
            length: 1,
            child: Column(
              children: [
                TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 8.0),

                  tabs: [
                /*    Tab(
                      child: Text('About Movie',

                          style: TextStyle(color: Colors.black,
                            fontSize: 12.sp,
                          )),
                    ),*/
                    Tab(
                      child: Text(

                        S.of(context).detailsTab2,
                        //  'Reviews',
                          style: TextStyle(
                            //color: Colors.black,
                        fontSize: 12.sp,

                      )),
                    ),

                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [

                   //   TopRatedContent(),
                      // Content for "Popular" tab
                      ReviewsList()
                    //  PopularContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class NowPlayingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual content for "Now Playing"
    return Center(child: Text('Now Playing Content'));
  }
}

class UpcomingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual content for "Upcoming"

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(

          child: Text('Upcoming Content')),
    );
  }
}

class TopRatedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual content for "Top Rated"
    return Center(child: Text('Top Rated Content'));
  }
}

class PopularContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual content for "Popular"
    return Center(child: Text('Popular Content'));
  }
}