import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'core/app_colors.dart';
import 'core/bloc_observer.dart';
import 'core/cache_helper.dart';
import 'core/dio_helper.dart';
import 'generated/l10n.dart';
import 'movie/film_details_screen/view_model/film_details_cubit.dart';
import 'movie/home_screen/view_model/home_cubit.dart';
import 'movie/home_screen/view_model/home_state.dart';
import 'movie/search_screen/view_model/search_cubit.dart';
import 'movie/splash_screen/splash_screen.dart';
import 'movie/video_screen/view/view_model/movie_video_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.Init_dio();
  await CacheHelper.init();
  var isDark = CacheHelper.getData(key: 'darkMode');
  var lang = CacheHelper.getData(key: 'lang');

  runApp( MyApp(isDark: isDark,lang:lang));
}

class MyApp extends StatelessWidget {
  final isDark;
  final lang;
  const MyApp({super.key,this.isDark,this.lang});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>  HomeCubit()..getTrend()
          ..getNowPlaying()
          ..getUpComing()
          ..getTopRated()
          ..changeMode(mode:isDark )
          ..toggleLanguage(lang:lang)

        ),

        BlocProvider(create: (context)=>  MovieDetalisCubit()),
        BlocProvider(create: (context)=>  MovieVideoCubit()),
        BlocProvider(create: (context)=>  SearchCubit()),



      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit=HomeCubit.get(context);
            ScreenUtil.init(context,
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,);
        return ScreenUtilInit(

            child: MaterialApp(
              //  title: 'Flutter Demo',
                locale: Locale(cubit.currentLanguage??'en'),

                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                theme:   ThemeData(
                  tabBarTheme: TabBarTheme(

                    labelColor: Colors.black,
                    // Set the indicator color to white to change the selected tab's title color
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.blueAccent
                          , width: 2.0

                      ),

                    ),
                  ),

                  primarySwatch: Colors.blueGrey,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: AppColors.primaryColor,
                    selectedItemColor: Colors.blueAccent,
                      type: BottomNavigationBarType.fixed,
                      unselectedItemColor: Colors.grey,
                      elevation: 20.0,
                     // Set the background color of the Bottom Navigation Bar to green
                  ),

              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: AppColors.primaryColor,
                titleTextStyle: const TextStyle(
                  color: Colors.grey, // Set the text color to white
                ),
                iconTheme: IconThemeData(
                  color: Colors.grey, // Set the color of action button icons in the AppBar to grey
                ),


              ),
          /*    colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blueGrey,
              ),*/
            ),
            darkTheme: ThemeData(

              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: AppColors.primaryColor,
                titleTextStyle: const TextStyle(
                  color: Colors.grey, // Set the text color to white
                ),
                iconTheme: IconThemeData(
                  color: Colors.grey, // Set the color of action button icons in the AppBar to grey
                ),


              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(

                backgroundColor: AppColors.primaryColor,
                selectedItemColor: Colors.blueAccent,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,

                // Set the background color of the Bottom Navigation Bar to green
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white, // Set the text color to white
                ),
                bodyText2: TextStyle(
                  color: Colors.white, // Set the text color to white
                ),
                // Set the text color of the selected tab in the Tab Bar to white
               // subtitle1: TextStyle(color: Colors.white),
              ),
              tabBarTheme: TabBarTheme(
                // Set the label color to white to change the selected tab's title color
              //  labelStyle: TextStyle(color: Colors.red),
                unselectedLabelStyle: TextStyle(color: Colors.green),
                labelColor: Colors.white,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blueAccent
                      , width: 2.0

                  ),

                ),
              ),
              scaffoldBackgroundColor: Colors.black,
            ),

                themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,

                home:SplashScreen())
        );}
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
