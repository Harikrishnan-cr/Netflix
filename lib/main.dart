import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';

import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/domain/core/di/injectable.dart';

import 'package:netflix/presentation/screen%20main/screen_main_page.dart';

Future<void>main() async{
WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (ctx) {
           return getIt<DownloadsBloc>();
         },) ,
         BlocProvider(create: (ctx) {
           return getIt<SearchBloc>();
         },),
          BlocProvider(create: (ctx) {
           return getIt<FastlaughBloc>();
         },),

          BlocProvider(create: (ctx) {
           return getIt<HotandnewBloc>();
         },),


           BlocProvider(create: (ctx) {
           return getIt<HomeBloc>();
         },),


        // FastlaughBloc
          
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          canvasColor: appCanvasColour,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: appTextWhite),
            bodyText2: TextStyle(color:appTextWhite),
          )
        ),
        home:  ScreenMAinPage(),    
          
      ),
    );
    
  }
}


