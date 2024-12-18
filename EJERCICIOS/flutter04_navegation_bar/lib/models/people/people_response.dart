import 'people.dart';

class PeopleListResponse {
  int? page;
  List<Person>? results;
  int? totalPages;
  int? totalResults;

  PeopleListResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  PeopleListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Person>[];
      json['results'].forEach((v) {
        results!.add(Person.fromJson(v));
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