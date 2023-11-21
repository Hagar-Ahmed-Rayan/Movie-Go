import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/movie/video_screen/view/view_model/video_details_states.dart';

import '../../../../core/api_endpoints.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../models/VideoModel.dart';






class MovieVideoCubit extends Cubit<MovieVideoStates> {
  MovieVideoCubit() : super(MovieVideoInitialState());


  final Dio dio = Dio();

  static MovieVideoCubit get(context) => BlocProvider.of<MovieVideoCubit>(context);





  VideoModel? videoModel;
  String currentLanguage=CacheHelper.getData(key: 'lang');

  void getMovieVideo(num id ) {
    emit(GetMovieVideoLoadingState());
    DioHelper.getData(
      url: '${ApiConst.MOVIE_DETAILS}'+'/'+'${id}'+'/'+'videos',
      //  query:  {'language': '$currentLanguage'}

    )

        .then((value) {
      videoModel = VideoModel.fromJson(value.data);
      print("get movie video sucess state");
      emit(GetMovieVideoSuccessState());
    }).catchError((error) {
      print("get movie video erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetMovieVideoErrorState());
    });
  }






}
