import 'dart:convert';

import 'package:news_app/data/entities/resource.dart';

SourcesModel sourcesModelFromJson(String str) =>
    SourcesModel.fromJson(json.decode(str));

String sourcesModelToJson(SourcesModel data) => json.encode(data.toJson());

class SourcesModel {
  String status;
  List<Resource> sources;

  SourcesModel({
    this.status,
    this.sources,
  });

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        sources: List<Resource>.from(
            json["sources"].map((x) => Resource.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "articles": List<dynamic>.from(sources.map((x) => x.toJson())),
      };
}
