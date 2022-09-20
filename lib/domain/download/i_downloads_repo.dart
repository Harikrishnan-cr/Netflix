


import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/download/mode/download_model.dart';

abstract class IDownloadRepo{

  Future<Either<MainFailure,List<Downloads>>> getDownloadsImages();

}