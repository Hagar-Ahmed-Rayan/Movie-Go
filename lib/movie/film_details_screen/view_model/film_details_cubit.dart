import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/api_endpoints.dart';
import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../../search_screen/view/screens/search_screen.dart';
import '../model/MovieDetailsModel.dart';
import '../model/review_model/ReviewModel.dart';
import 'film_details_states.dart';




class MovieDetalisCubit extends Cubit<MovieDetalisStates> {
  MovieDetalisCubit() : super(MovieDetalisInitialState());


  final Dio dio = Dio();

  static MovieDetalisCubit get(context) => BlocProvider.of<MovieDetalisCubit>(context);





  MovieDetailsModel? movieDetailsModel;
  String currentLanguage=CacheHelper.getData(key: 'lang');

  void getMovieDetails(num id ) {
    emit(GetMovieDetailsLoadingState());
    DioHelper.getData(
      url: '${ApiConst.MOVIE_DETAILS}'+'/'+'${id}',
      query:  {'language': '$currentLanguage'}

    )

        .then((value) {
      movieDetailsModel = MovieDetailsModel.fromJson(value.data);
      print("get movie details sucess state");
      emit(GetMovieDetailsSuccessState());
    }).catchError((error) {
      print("get details erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetMovieDetailsErrorState());
    });
  }

//get rate

  ReviewModel? reviewModel;

  void getReviews(num id ) {
    emit(GetMovieReviewsLoadingState());
    DioHelper.getData(
      url: '${ApiConst.MOVIE_DETAILS}'+'/'+'${id}'+'/reviews',
        query:  {'language': '$currentLanguage'}

    )

        .then((value) {
      reviewModel = ReviewModel.fromJson(value.data);
      print("get movie reviews sucess state");
      emit(GetMovieReviewsSuccessState());
    }).catchError((error) {
      print("get reviews erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetMovieReviewsErrorState());
    });
  }




}
