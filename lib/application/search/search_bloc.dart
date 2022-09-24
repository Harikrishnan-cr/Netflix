
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/download/i_downloads_repo.dart';
import 'package:netflix/domain/download/mode/download_model.dart';
import 'package:netflix/domain/search/model/search_resp.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {  
  final IDownloadRepo _downloadRepoService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadRepoService)
      : super(SearchState.initial()) {
    //-------Idle state-------------
    on<Initialize>((event, emit) async {
      if(state.idlelist.isNotEmpty){
        emit( SearchState(
          searchResultData: [], idlelist: state.idlelist, isLoading: false, isError: false));
          return;   
      }
      emit(const SearchState(
          searchResultData: [], idlelist: [], isLoading: true, isError: false));
      //get trending
      final _result = await _downloadRepoService.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultData: [],
              idlelist: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {   
          return SearchState(
              searchResultData: [],    
              idlelist: list,
              isLoading: false,
              isError: false);
        },
      );
      //show to ui
      emit(_state);
    });  



    //-------Search Result state-------------

    on<SearchMovie>((event, emit) async{


       emit(const SearchState(
          searchResultData: [], idlelist: [], isLoading: true, isError: false));
      //-----call search movie
      final _result = await  _searchService.searchMovie(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {

 return const SearchState(
              searchResultData: [],
              idlelist: [],
              isLoading: false,
              isError: true);
      }, (SearchResp r) {

         return SearchState(
              searchResultData: r.results,    
              idlelist: [],
              isLoading: false,
              isError: false);

      });
      emit(_state);
      
    });
  }
}
