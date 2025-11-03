import 'package:http/http.dart' as http;
import '../data_models/cat_model.dart';
import '../data_models/dog_fact_model.dart';

/// Fetches a single DogFact payload (facts list + success flag).
Future<CatFact> fetchDogFact() async {
  final uri = Uri.parse('https://catfact.ninja/fact?max_length=100');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Cat API ${resp.statusCode}');
  }

  return catFactFromJson(resp.body);
}
