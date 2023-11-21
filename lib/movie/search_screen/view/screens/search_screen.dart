import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api_endpoints.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/error_widget.dart';
import '../../../../core/loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../home_screen/view_model/home_cubit.dart';
import '../../view_model/search_cubit.dart';
import '../../view_model/search_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _searchController = TextEditingController();
    return BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=SearchCubit.get(context);
      return Scaffold(

        appBar: null,
        body: SafeArea(child: Scaffold(
            body: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 30.r),
                    child:
                    TextFormField(
                      controller: _searchController,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],

                        labelText: S.of(context).search,
                    //    'Search',
                        labelStyle: TextStyle(
                          color: Colors.grey, // Set the label text color here
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp
                        ),
                        hintText: S.of(context).hintSearch,
                        //'Search for a movie',
                        prefixIcon: Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).validateSearch;
                        }
                        return null;
                      },
                      onFieldSubmitted: (value){
                        if (_formKey.currentState!.validate()) {
                       //   String? currentLanguage=  BlocProvider.of<HomeCubit>(context).currentLanguage;

                         // cubit.getSearchResult(_searchController.text,currentLanguage!);

                          cubit.getSearchResult(_searchController.text);


                        }

                      },
                    ),
                  ),
                ),

 if ((state is GetSearchResultSuccessState )&&( cubit.searchModel!=null) &&(cubit.searchModel!.results!.isNotEmpty))
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit.searchModel?.results?.length ?? 0,
      separatorBuilder: (context, index) =>
      SizedBox(height: 8.h),
      itemBuilder: (context, index) =>
      InkWell(
      onTap: () {
      },
      child: Row(
         children: [


           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                 width: 200.w,
                 height: 150.h,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        20.r,
      ),
      ),

               child:
               (cubit.searchModel?.results?[index].backdropPath !=null)?
               ClipRRect(  // Wrap the Image with ClipRRect
                 borderRadius: BorderRadius.circular(20.r), // The same border radius as the Container
                 child: Image.network(
                   '${ApiConst.BASE_IMAGE_URL}/${cubit.searchModel?.results?[index].backdropPath}',

                  // '${ApiConst.BASE_IMAGE_URL}/${cubit.trendModel?.results?[index].posterPath}',
                   fit: BoxFit.cover,

                 ),
               ):
               Container(
                 width: 200.w,
                 height: 150.h,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(
                     20.r,
                   ),
                   color: AppColors.primaryColor,
                 ),
                 child:  Center(
                     child: Text(
                       S.of(context).noImage,
                  //     'No Image',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                       //  color: Colors.white

                       ),
                     )),
               )
             ),
           ),
           SizedBox(
             width: 10.w,
           ),
        Flexible(
          child: Text(

            '${cubit.searchModel?.results?[index].title}',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
            //  color: Colors.black,
              fontWeight: FontWeight.bold

            ),
          ),
        ),

         ],
      ),

      ),
      ),
                )
               else if ((state is GetSearchResultSuccessState )&&( cubit.searchModel!=null) &&(cubit.searchModel!.results!.isEmpty))
          Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.error, size: 48.0, color: Colors.red),

          Text(
            S.of(context).noSearchResult,

          ),
          ],
          ),
          )
              //   Center(child:Text('there are no items'))

                else if( state is GetSearchResultLoadingState)
   CustomLoadingIndicator()

 else if (state is GetSearchResultErrorState)
          CustomErrorWidget(
          errorMessage: state.error,
          )

   /*  else
         CustomLoadingIndicator()*/
              ],
            ))),
      );}
    );
  }
}
