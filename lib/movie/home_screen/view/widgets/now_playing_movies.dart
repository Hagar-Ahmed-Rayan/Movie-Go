
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/shared_functions.dart';

import '../../../../core/api_endpoints.dart';
import '../../../film_details_screen/view/screens/film_details_screen.dart';
import '../../../film_details_screen/view_model/film_details_cubit.dart';
import '../../../video_screen/view/view_model/movie_video_cubit.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},

      builder: ( context,  state) {
      //  var cubit=BlocProvider.of<HomeCubit>(context);
          var cubit=HomeCubit.get(context);

        return GridView.builder(
         //   physics:NeverScrollableScrollPhysics(),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in each row
          mainAxisSpacing: 15,
            crossAxisSpacing: 10,

          childAspectRatio: 0.63,


      ),
        itemCount: cubit.nowPlayingModel?.results?.length??0, // Total number of items
        itemBuilder: (context, index) {


          return InkWell(
      onTap: () {
        print("idddddddddddddddddddddddddddddddddddddddd");
        BlocProvider.of<MovieDetalisCubit>(context).movieDetailsModel=null;

        print(cubit.nowPlayingModel!.results![index].id!);
        BlocProvider.of<MovieDetalisCubit>(context).getMovieDetails(cubit.nowPlayingModel!.results![index].id!);
        BlocProvider.of<MovieVideoCubit>(context).getMovieVideo(cubit.nowPlayingModel!.results![index].id!);
        BlocProvider.of<MovieDetalisCubit>(context).getReviews(cubit.nowPlayingModel!.results![index].id!);

        navto(context,  FilmDetailsScreen( movieItem: cubit.nowPlayingModel?.results?[index]));
      },

      child: Column(
              children: [
                Container(
                  width: 190.w, // Adjust the width as needed
                  height: 220.h, // Adjust the height as needed
                  child: Image.network(
                    '${ApiConst.BASE_IMAGE_URL}/${cubit.nowPlayingModel?.results?[index].posterPath}',

                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                SizedBox(height: 5.h), // Space between image and text
                Flexible(
                  child: Text(
                    '${cubit.nowPlayingModel?.results?[index].title}',
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                    ),
                  ),
                ),            ],
            ),
          );
        },
      );
  }
    );
  }
}
