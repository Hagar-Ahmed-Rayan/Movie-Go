import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/movie/search_screen/view_model/search_states.dart';
import '../../../core/api_endpoints.dart';
import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../../home_screen/view_model/home_cubit.dart';
import '../../search_screen/view/screens/search_screen.dart';
import '../models/SearchModel.dart';



class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());


  final Dio dio = Dio();

  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  String currentLanguage=CacheHelper.getData(key: 'lang');

  SearchModel? searchModel;
  void getSearchResult(String movie) {
    emit(GetSearchResultLoadingState());
    DioHelper.getData(
      url: ApiConst.SEARCH,
      query:    {'query': movie,'language': '$currentLanguage'},

    )

        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print("get SEARCH sucess state");
      emit(GetSearchResultSuccessState());
    }).catchError((error) {
      print("get SEARCH erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetSearchResultErrorState(error.toString()));
    });
  }






}
