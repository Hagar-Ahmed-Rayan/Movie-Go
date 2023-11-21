import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../view_model/movie_video_cubit.dart';
import '../view_model/video_details_states.dart';


class VideoScreen extends StatelessWidget {

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieVideoCubit, MovieVideoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieVideoCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (cubit.videoModel!=null)?
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                      itemCount: cubit.videoModel?.results?.length ?? 0,
                      itemBuilder: (context, current) {
                        final YoutubePlayerController controller =
                        YoutubePlayerController(
                          initialVideoId:
                          '${cubit.videoModel?.results?[current].key}',
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                           // loop: false,
                            //showLiveFullscreenButton: false,
                          ),
                        );
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.play();
                              },
                              child: SizedBox(
                                height: 130.h,
                                child: YoutubePlayer(
                                  controller: controller,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blueAccent,
                                 // liveUIColor: Colors.blueGrey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              child: Text(
                                '${cubit.videoModel?.results?[current].name}',
                                style: TextStyle(
                                //  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      },
                    ):
                        CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
