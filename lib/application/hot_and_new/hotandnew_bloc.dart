import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/mode/hot_and_new_resp.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotandNewService;
  HotandnewBloc(this._hotandNewService) : super(HotandnewState.initial()) {
    //hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
//loading

      emit(const HotandnewState(
          comingSoonList: [],
          everyOneisWatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await _hotandNewService.getHotAndNewMovieData();

   final _newState =   _result.fold((MainFailure failure) {
        return const HotandnewState(
            comingSoonList: [],
            everyOneisWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {

         return  HotandnewState(
            comingSoonList: resp.results,
            everyOneisWatchingList: state.everyOneisWatchingList,
            isLoading: false,
            hasError: false);
      });

      emit(_newState);
    });     

    on<LoadDataInEveryOneIsWatching>((event, emit) async {


       emit(const HotandnewState(
          comingSoonList: [],
          everyOneisWatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await _hotandNewService.getHotAndNewTvData();

   final _newState =   _result.fold((MainFailure failure) {
        return const HotandnewState(
            comingSoonList: [],
            everyOneisWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {

         return  HotandnewState(
            comingSoonList: state.comingSoonList,   
            everyOneisWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });

      emit(_newState);
     
    });
  }
}
