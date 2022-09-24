import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/domain/core/debounce/debounce.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

import 'package:netflix/presentation/search/widget/search%20widget/search_widget.dart';

class ScearchScreen extends StatelessWidget {
   ScearchScreen({Key? key}) : super(key: key);

  final _debounce = Debouncer(milliseconds:1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.35),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              onChanged: (value) {

                if(value.isEmpty){
                return;   
                }
                _debounce.run(() {

BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
                 });    
                
              },
              
            ),
            commonHeight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
if(state.searchResultData.isEmpty){    
    
return const SearchWidgetScreen();
}else{
  return const OnSearchScreen();     
}

                
              },
            ))
            // const Expanded(child: OnSearchScreen())
            // const Text('Top Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
          ],
        ),
      )),
    );
  }
}
