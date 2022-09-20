part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState{
  const factory DownloadsState({
    required bool isLoading,
    required List<Downloads> download,
     required Option<Either<MainFailure,List<Downloads>>> downloadFailureOrSuccesOption,
  }) = _DownloadsState;

  factory DownloadsState.inital(){
    return const DownloadsState(isLoading: false, downloadFailureOrSuccesOption:None(),
    download: []
     );
  }
}
