import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/download/i_downloads_repo.dart';
import 'package:netflix/domain/download/mode/download_model.dart';
part 'downloads_bloc.freezed.dart'; 
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {

  final IDownloadRepo _downloadRepo; 
  DownloadsBloc(this._downloadRepo) : super(DownloadsState.inital()) {
    on<_getDownloadsImages>((event, emit) async{

emit(
        state.copyWith(
          isLoading: true,
         downloadFailureOrSuccesOption: none()
        ),
      );

     final Either<MainFailure,List<Downloads>> downloadOptions = await _downloadRepo.getDownloadsImages();
           
     emit(
        downloadOptions.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadFailureOrSuccesOption: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
           download: success,
            downloadFailureOrSuccesOption: Some(
              Right(success),
            ),
          ),
        ),
      );
      
    });
  }
}
