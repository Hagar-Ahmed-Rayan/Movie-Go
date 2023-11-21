import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api_endpoints.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';


class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);


    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: 250.h,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 7.w,
              ),
              itemCount: cubit.trendModel?.results?.length ?? 0,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      // cubit.GetReview(cubit
                      //     .trendingMovieModel!.results![index].id as int);
                      // cubit.getGenre(cubit
                      //     .trendingMovieModel!.results![index].id as int);
                      // cubit.GetCast(cubit
                      //     .trendingMovieModel!.results![index].id as int);
                      // cubit.getVideos(cubit
                      //     .trendingMovieModel!.results![index].id as int);
                      // pushNavigate(
                      //     context,
                      //     DetailsScreen(
                      //       id: cubit.trendingMovieModel?.results?[index],
                      //     ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),  // Border radius
                        ),
                      ),
                      child: ClipRRect(  // Wrap the Image with ClipRRect
                        borderRadius: BorderRadius.circular(20.r), // The same border radius as the Container
                        child: Image.network(
                          '${ApiConst.BASE_IMAGE_URL}/${cubit.trendModel?.results?[index].posterPath}',
                          fit: BoxFit.cover,
                          height: 240.h,
                          width: 150.w,
                        ),
                      ),
                    ),

                  ),
                ],
              )),
        );
      },
    );
  }
}
