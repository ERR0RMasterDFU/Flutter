import 'tv_show.dart';

class SeriesListResponse {
  int? page;
  List<TVShow>? results;
  int? totalPages;
  int? totalResults;

  SeriesListResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  SeriesListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TVShow>[];
      json['results'].forEach((v) {
        results!.add(TVShow.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}