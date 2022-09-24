import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix/presentation/fast%20laughs/widget/pageview_widget.dart';

// final videoList = [
//    const  PageViewVideoListScreen(pageViewColour: Colors.purple,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.green,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.blue,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.red,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.amber,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.orange,),
//            const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 0, 72, 94),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 5, 255, 14),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 225, 5, 137),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 26, 4, 107),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 0, 0, 0),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 255, 21, 0),),
// ];

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    //   BlocProvider.of<FastlaughBloc>(context).add(const Initialize());      
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {     
       BlocProvider.of<FastlaughBloc>(context).add(const Initialize()); 
    });
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastlaughBloc, FastlaughState>(
      builder: (context, state) {

        if(state.isLoading){
return const Center(child: CircularProgressIndicator(strokeWidth: 2,color: Colors.red,),);
        }else if(state.isError){
return const Center(child: Text('Error While Loading Data'),);
        }else if(state.videosList.isEmpty){
return const Center(child: Text('Video List Empty'),);
        }else{

          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
                state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                    key: Key(index.toString()),
                    widget: PageViewVideoListScreen(index: index), movieData: state.videosList[index]);
                }));

        }
            
      },
    )));
  }
}
