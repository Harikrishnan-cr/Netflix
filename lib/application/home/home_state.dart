part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateid,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> pastyearMovieList,
    required List<HotAndNewData> tensDramaMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      trendingMovieList: [],
      pastyearMovieList: [],
      tensDramaMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isLoading: false,
      hasError: false,
      stateid: '0'
      );
      
}
