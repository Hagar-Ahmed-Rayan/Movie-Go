import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api_endpoints.dart';
import '../../../../core/shared_functions.dart';
import '../../../../generated/l10n.dart';
import '../../../home_screen/models/now_playing_model/Results.dart';
import '../../../video_screen/view/screens/video_screen.dart';
import '../../view_model/film_details_cubit.dart';
import '../../view_model/film_details_states.dart';
import '../widgets/details_tabbar.dart';

class FilmDetailsScreen extends StatelessWidget {
  final Results ?movieItem;
  final num ?movieId;

  const FilmDetailsScreen({super.key,this.movieItem,this.movieId});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return  BlocConsumer<MovieDetalisCubit, MovieDetalisStates>(
        listener: (context, state) {},
         builder: (context,states){
          var cubit=MovieDetalisCubit.get(context);
      return SafeArea(child:
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              (cubit.movieDetailsModel!=null)?
          Column(
          children: [


          Container(
                height: 350.h,
                child: Stack(

                  children: [
                    SizedBox(
                      height: 189.h,
                   width: double.infinity,
                   child: ClipRRect(

                      /*borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          16.r,
                        ),
                        bottomLeft: Radius.circular(
                          16.r,
                        ),
                      ),*/
                      child: Image.network(
                        '${ApiConst.BASE_IMAGE_URL}/${cubit.movieDetailsModel!.backdropPath}',

                     //   '${ApiConst.BASE_IMAGE_URL}/${movieItem!.backdropPath}',
                        fit: BoxFit.cover,
                    //    height: 180.h,
                      //  width: double.infinity,
                      ),
                    ),
                    ),
                    Positioned(
                        top: 160.h,
                        left: 10.w,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 170.h,
                              width:  140.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16.r,
                                ),
                                child: Image.network(
                                 // '${ApiConst.BASE_IMAGE_URL}/${movieItem!.posterPath}',
                                  '${ApiConst.BASE_IMAGE_URL}/${cubit.movieDetailsModel!.posterPath}',

                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                     // '${movieItem!.title}',
                           '${cubit.movieDetailsModel!.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(

                       // color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                      ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_border,
                                    //color: Colors.deepOrange,
                                    //color: Colors.red,

                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(

                                 //   '${movieItem!.voteAverage}',
                                    '${cubit.movieDetailsModel!.voteAverage}',

                                    style: TextStyle(
                                    //  color: Colors.yellowAccent,
                                     // color: Colors.red,

                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  print("viddddddddddddddddddddddddddddddddddd");
                                 navto(context,VideoScreen());

                                },
                                child: Row(
                                  children: [
                                    Text(
                                      S.of(context).watchNow,
                                   //   'watch Now',

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),

                                    const Icon(
                                      Icons.live_tv,
                                      color: Colors.blueGrey,
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),

                          ],
                        )


                    )
                  ],
                ),
              ),
             /* SizedBox(
                height: 1.h,
              ),*/

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    '${movieItem!.releaseDate}',
                    style: TextStyle(
                    ),
                  ),
                  SizedBox(
                      height: 20.h,
                      child: const VerticalDivider(
                        width: 2,
                        color: Colors.blueGrey,
                      )),
                  const Icon(
                    Icons.language,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    '${movieItem!.originalLanguage}',
                    style: TextStyle(
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: const VerticalDivider(
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const Icon(Icons.category,
                      color: Colors.blueGrey),
                  SizedBox(
                    width: 75.w,
                    child: Text(
                      '${cubit.movieDetailsModel?.genres?.map((genre) =>
                      genre.name).join(" , ")
                      }',
                      style: TextStyle(
                      ),
                    ),
                  ),

                ],),
              ]):
              Center(child: CircularProgressIndicator()),

              SizedBox(
                height: 2.h,
              ),




           DetailsTabbar()
            ],
          ),
        ),


      ));}
    );
  }
}
