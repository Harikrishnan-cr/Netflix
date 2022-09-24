part of 'fastlaugh_bloc.dart';

@freezed
class FastlaughEvent with _$FastlaughEvent {
  const factory FastlaughEvent.initialize() = Initialize;
   const factory FastlaughEvent.likeVides({
    required int id
   }) = LikeVides;
    const factory FastlaughEvent.unLikeVides({
       required int id
    }) = UnLikeVides;
}