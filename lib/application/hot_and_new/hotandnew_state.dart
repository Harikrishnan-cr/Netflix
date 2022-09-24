part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneisWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;  

  factory HotandnewState.initial()=> const HotandnewState(comingSoonList: [], everyOneisWatchingList: [], isLoading: false, hasError: false);
}



/* 
he redirected constructor '_Initial Function()' has incompatible parameters with 'HotandnewState Function({dynamic })'.
hotandnew_bloc.freezed.dart
*/