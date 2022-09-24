// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/domain/download/i_downloads_repo.dart';
import 'package:netflix/domain/download/mode/download_model.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart'; 

ValueNotifier<Set<int>> likedVideosNotifier = ValueNotifier({});



@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
  

emit(
  const FastlaughState(videosList: [], isLoading: true, isError: false,)    
);


      //trending movies
      final _result = await _downloadService.getDownloadsImages();

      final _state = _result.fold((l) {
        return  FastlaughState(videosList: [], isLoading: false, isError: true,);
      }, (resp) {
        return FastlaughState(
            videosList: resp, isLoading: false, isError: false,);
      });

      //sent to ui

      emit(_state);
    });

    on<LikeVides>((event, emit) {
     likedVideosNotifier.value.add(event.id);
     
    
    });
    on<UnLikeVides>((event, emit) {
     likedVideosNotifier.value.remove(event.id);
    
      
    });
  }
}
