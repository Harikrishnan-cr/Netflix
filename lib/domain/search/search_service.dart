


import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_resp.dart';

abstract class SearchService{


  Future<Either<MainFailure,SearchResp>> searchMovie({
required String movieQuery,
  });
}