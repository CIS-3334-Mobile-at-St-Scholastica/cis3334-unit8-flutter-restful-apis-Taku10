// To parse this JSON data, do
//
//     final dogFact = dogFactFromJson(jsonString);

import 'dart:convert';

CatFact catFactFromJson(String str) => CatFact.fromJson(json.decode(str));

String catFactToJson(CatFact data) => json.encode(data.toJson());

class CatFact {
  List<String> fact;

  CatFact({
    required this.fact,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) => CatFact(
    fact: List<String>.from(json["fact"].map((x) => x))
  );

  Map<String, dynamic> toJson() => {
    "fact": List<dynamic>.from(fact.map((x) => x))
  };
}
