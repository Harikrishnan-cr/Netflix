


import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_model.freezed.dart';
part 'download_model.g.dart';
// part 'mode/download_model.freezed.dart';
// part 'download_model.g.dart';
// part 'download_model.g.dart';
@freezed
class Downloads with _$Downloads{
  const factory Downloads({
  @JsonKey(name: "poster_path") required String? posterPath,

  @JsonKey(name: "title") required String? title 
  }) = _Downloads;
  


  factory Downloads.fromJson(Map<String, dynamic> json) => _$DownloadsFromJson(json);
}


