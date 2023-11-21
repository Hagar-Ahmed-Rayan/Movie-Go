import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';
import '../widgets/categories_tabbar.dart';
import '../widgets/treanding_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          return Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Column(
              children: [
                cubit.trendModel == null
                    ? CircularProgressIndicator(
                  color: Colors.blueGrey,
                )
                    :  TrendingList(),
                SizedBox(height: 10.h),
                CategoriesTabbar()
              ],
            ),
          ),
        ),


      );
  }
    );
  }
}
