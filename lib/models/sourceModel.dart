class SourceResponse {
  String? status;
  List<Sources>? sources;
  String? code;
  String? message;



  SourceResponse({this.status, this.sources,this.code,this.message});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];

    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(new Sources.fromJson(v));
      });
    }
  }

}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(
      {this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

}