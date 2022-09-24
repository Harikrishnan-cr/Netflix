import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/mode/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //HomeScreen Data
    on<GetHomeScreenData>((event, emit) async {
      //Send Loading To Ui

      emit(state.copyWith(isLoading: true, hasError: false));

      //Get Data

      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //Tranform Data

//movie ----------------------
 final _stateOne =  _movieResult.fold((MainFailure failure) {
        return  HomeState(
          stateid: DateTime.now().microsecondsSinceEpoch.toString(),
          trendingMovieList: [],
          pastyearMovieList: [],
          tensDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final tensDrama = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        tensDrama.shuffle();
        southIndian.shuffle();
        return  HomeState(
          stateid: DateTime.now().microsecondsSinceEpoch.toString(),
          trendingMovieList: trending,
          pastyearMovieList: pastYear,
          tensDramaMovieList: tensDrama,
          southIndianMovieList: southIndian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          hasError: false,
        );
      });


      emit(_stateOne);

//-----------tv--------------------

    final _stateTwo =   _tvResult.fold((MainFailure failure) {
        return  HomeState(
          stateid: DateTime.now().microsecondsSinceEpoch.toString(),
          trendingMovieList: [],
          pastyearMovieList: [],
          tensDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final topTen = resp.results;
        return  HomeState(
          stateid: DateTime.now().microsecondsSinceEpoch.toString(),
          trendingMovieList: state.trendingMovieList,
          pastyearMovieList: state.pastyearMovieList,
          tensDramaMovieList: state.tensDramaMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: topTen,
          isLoading: false,
          hasError: false,
        );

      });

      //send to ui

       emit(_stateTwo);
    });
  }
}
