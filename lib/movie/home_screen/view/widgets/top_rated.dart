
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api_endpoints.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},

        builder: ( context,  state) {
          var cubit=HomeCubit.get(context);

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items in each row
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,

              childAspectRatio: 0.63,


            ),
            itemCount: cubit.topRatedModel?.results?.length??0, // Total number of items
            itemBuilder: (context, index) {


              return InkWell(
                onTap: () {},

                child: Column(
                  children: [
                    Container(
                      width: 190.w, // Adjust the width as needed
                      height: 220.h, // Adjust the height as needed
                      child: Image.network(
                        '${ApiConst.BASE_IMAGE_URL}/${cubit.topRatedModel?.results?[index].posterPath}',

                        fit: BoxFit.fill, // Adjust the fit as needed
                      ),
                    ),
                    SizedBox(height: 5.h), // Space between image and text
                    Flexible(
                      child: Text(
                        '${cubit.topRatedModel?.results?[index].title}',
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
