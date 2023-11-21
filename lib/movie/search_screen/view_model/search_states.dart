abstract class SearchStates {}
class SearchInitialState extends  SearchStates{}


//get trend state
class GetSearchResultLoadingState extends   SearchStates{}
class GetSearchResultSuccessState extends   SearchStates{}
class GetSearchResultErrorState extends   SearchStates{
final String error;
  GetSearchResultErrorState  (this .error);

}