  abstract class MovieDetalisStates {}
  class MovieDetalisInitialState extends  MovieDetalisStates{}


//get details state
  class GetMovieDetailsLoadingState extends   MovieDetalisStates{}
  class GetMovieDetailsSuccessState extends   MovieDetalisStates{}
  class GetMovieDetailsErrorState extends   MovieDetalisStates{}
//get reviews
 class  GetMovieReviewsLoadingState extends   MovieDetalisStates{}
 class GetMovieReviewsSuccessState extends   MovieDetalisStates{}
 class  GetMovieReviewsErrorState extends   MovieDetalisStates{}