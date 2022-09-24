

import 'package:netflix/core/strings/base_url.dart';
import 'package:netflix/infrastructure/api/api_key.dart';

class ApiEndPoints{
  static const downloads = '$baseUrl/trending/all/day?api_key=$apikey';
  static const search = '$baseUrl/search/movie?api_key=$apikey';
  static const hotAndNewMovie = '$baseUrl/discover/movie?api_key=$apikey';
  static const hotAndNewTv = '$baseUrl/discover/tv?api_key=$apikey';
}

// /discover/tv?api_key=