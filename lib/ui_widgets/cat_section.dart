import 'package:flutter/material.dart';
import '../data_models/cat_model.dart';
import '../services/cat_service.dart' as cat_svc;

class CatSection extends StatelessWidget {
  const CatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CatFact>(
      future: cat_svc.fetchDogFact(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final fact = snap.data;
        if (fact == null) {
          return const Center(child: Text('No Cat fact found.'));
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              fact.fact.first,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}
