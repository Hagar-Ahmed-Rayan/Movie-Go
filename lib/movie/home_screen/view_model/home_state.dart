
import 'dart:io';


abstract class HomeStates {}
class HomeInitialState extends  HomeStates{}


//get trend state
class GetTrendLoadingState extends   HomeStates{}
class GetTrendSuccessState extends   HomeStates{}
class GetTrendErrorState extends   HomeStates{}



//change nav bar index
class ChangeIndexState extends   HomeStates{}


//now playing states
class GetNowPlayingLoadingState extends   HomeStates{}
class GetNowPlayingSuccessState extends   HomeStates{}
class GetNowPlayingErrorState extends   HomeStates{}


/// upcoming states
class GetUpComingLoadingState extends   HomeStates{}
class GetUpComingSuccessState extends   HomeStates{}
class GetUpComingErrorState extends   HomeStates{}

//get top rated
class GetTopRatedLoadingState extends   HomeStates{}
class GetTopRatedSuccessState extends   HomeStates{}
class GetTopRatedErrorState extends   HomeStates{}

//chang mode
class ModeChangeSuccessState extends   HomeStates{}



//change lang
class LanguageChangeState extends   HomeStates{}

