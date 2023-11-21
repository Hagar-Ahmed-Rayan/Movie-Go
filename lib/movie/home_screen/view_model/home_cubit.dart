import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/api_endpoints.dart';
import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../../../generated/l10n.dart';
import '../../search_screen/view/screens/search_screen.dart';
import '../models/now_playing_model/NowPlayingModel.dart';
import '../models/top_rated_model/TopRatedModel.dart';
import '../models/trend_model/TrendingModel.dart';
import '../models/up_coming_model/UpComingModel.dart';
import '../view/screens/home_screen.dart';
import 'home_state.dart';




class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());


  final Dio dio = Dio();

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  //nav bar
  int currentIndex = 0;
  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.movie_sharp,

      ),
      label: '',
    ),
     BottomNavigationBarItem(
     icon: Icon(
       Icons.search_rounded,

        size: 30,
      ),

      label: '',
    ),


  ];
  final homeScreen = HomeScreen();//trending now playing

  final searchScreen = SearchScreen();


  Widget getCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return  homeScreen;


      default:
        return  searchScreen;
    }
  }
//get trending
  TrendingModel? trendModel;

  void getTrend() {
    emit(GetTrendLoadingState());
    DioHelper.getData(
        url: ApiConst.TREND,
        query: {'language': '$currentLanguage'}

    )

        .then((value) {
      trendModel = TrendingModel.fromJson(value.data);
    print("get trend sucess state");
      emit(GetTrendSuccessState());
    }).catchError((error) {
      print("get trend erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetTrendErrorState());
    });
  }


  //get now playing
  NowPlayingModel? nowPlayingModel;

  void getNowPlaying() {
    emit(GetNowPlayingLoadingState());
    DioHelper.getData(
      url: ApiConst.NOW_PLAYING,
        query: {'language': '$currentLanguage'}
    )


        .then((value) {
      nowPlayingModel = NowPlayingModel.fromJson(value.data);
      print("get now playing sucess state");
      emit(GetNowPlayingSuccessState());
    }).catchError((error) {
      print("get now playing erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetNowPlayingErrorState());
    });
  }



  //get up coming movies
  UpComingModel? upComingModel;

  void getUpComing() {
    emit(GetUpComingLoadingState());
    DioHelper.getData(
      url: ApiConst.UP_COMING,
        query: {'language': '$currentLanguage'}

    )

        .then((value) {
      upComingModel = UpComingModel.fromJson(value.data);
      print("get up coming  sucess state");
      emit(GetUpComingSuccessState());
    }).catchError((error) {
      print("get up coming erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetUpComingErrorState());
    });
  }

//get top rated
  TopRatedModel? topRatedModel;

  void getTopRated() {
    emit(GetTopRatedLoadingState());
    DioHelper.getData(
      url: ApiConst.TOP_RATED,
        query: {'language': '$currentLanguage'}

    )

        .then((value) {
      topRatedModel = TopRatedModel.fromJson(value.data);
      print("get top rated  sucess state");
      emit(GetTopRatedSuccessState());
    }).catchError((error) {
      print("get top rated erorr state");

      print(error.toString());
      if (error is DioError ) {
        print( error.response?.data);



      }

      emit(GetTopRatedErrorState());
    });
  }
  bool isDark=false;
  //change mode
  void changeMode({bool? mode}) async { //may call it from main or from button
    if (mode != null) { //call from  main and mode is assigned befor
      isDark = mode;
      print("in is dark ifffffffffffffffffffffffffffff");
      emit(ModeChangeSuccessState());
    } else {  //it is first time  so mode ==null 'call from main'+call from button
      isDark = !isDark; //isdark=true
      CacheHelper.saveData(key: 'darkMode', value: isDark);//
      print("in is dark elseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

      emit(ModeChangeSuccessState());
    }
  }
  //change lang
 String? currentLanguage;

  void toggleLanguage({String? lang}) async { //may call it from main or from button
    if (lang != null) { //call from  main and mode is assigned befor
      currentLanguage = lang;
      print("in is lang ifffffffffffffffffffffffffffff");
      emit(LanguageChangeState());
    } else {  //it is first time  so mode ==null 'call from main'+call from button
      print("in is lang elseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

      if (currentLanguage == 'ar') {
        currentLanguage = 'en';
        CacheHelper.saveData(key: 'lang', value: currentLanguage);//

        emit(LanguageChangeState());
      }
      else {
        currentLanguage = 'ar';
        CacheHelper.saveData(key: 'lang', value: currentLanguage);//

        emit(LanguageChangeState());
      }

    }
  }





 /* void toggleLanguage() {
    if (currentLanguage == 'ar') {
      currentLanguage = 'en';
      emit(LanguageChangeState());
    } else {
      currentLanguage = 'ar';
      emit(LanguageChangeState());
    }
  }*/

  /*changeLang() {
    if (Intl.getCurrentLocale() == 'en') {
      S.load(const Locale('ar'));
    } else {
      S.load(const Locale('en'));
    }
  }*/



}
