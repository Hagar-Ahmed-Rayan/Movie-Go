import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api_endpoints.dart';
import '../../../../core/loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/film_details_cubit.dart';
import '../../view_model/film_details_states.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetalisCubit, MovieDetalisStates>(
      builder: (context, state) {
        var cubit = MovieDetalisCubit.get(context);
        if(cubit.reviewModel==null )
 return CustomLoadingIndicator();
          else if (cubit.reviewModel!=null && cubit.reviewModel!.results!.isEmpty )
          return Center(child: Text(
          //    'There Are No Reviews Yet !'
                  S.of(context).noReviews,
          ),);
        return SizedBox(
          height: 250.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            shrinkWrap: true,
            itemCount: cubit.reviewModel?.results?.length ?? 0,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: cubit.reviewModel?.results?[index]
                            .authorDetails?.avatarPath !=
                            null
                            ? NetworkImage(
                          '${ApiConst.BASE_IMAGE_URL}/${cubit.reviewModel?.results?[index].authorDetails?.avatarPath}',
                        )
                            : const NetworkImage(
                          'https://img.freepik.com/premium-vector/3d-icon-user-profile-convex-volume-shape-person-circle_348818-1116.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '${cubit.reviewModel?.results?[index].authorDetails?.username}',
                        style: TextStyle(
                          //color: cubit.dark ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      (cubit.reviewModel?.results?[index].authorDetails?.rating!=null )?
                      Row(
                        children: [
                          Text(
                            '${cubit.reviewModel?.results?[index].authorDetails?.rating ?? 'No rate'}',
                            style: TextStyle(
                           //   color: cubit.dark ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                           color: Colors.yellow
                            //    //cubit.dark ? Colors.white : Colors.black,
                          )
                        ],
                      ):Text(
                          S.of(context).noRate,

                      )
                      ,
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '${cubit.reviewModel?.results?[index].content}',
                    style: TextStyle(
                   //   color: cubit.dark ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}