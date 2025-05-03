import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../viewModel/api_service.dart';


class MealDetailPage extends StatelessWidget {
  final String mealId;
  MealDetailPage({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Details')),
      body: FutureBuilder<Meal>(
        future: ApiService.fetchMealDetail(mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData) return Center(child: Text('No details'));

          final meal = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(meal.thumbnail),
                SizedBox(height: 20),
                Text(meal.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(meal.instructions ?? '', textAlign: TextAlign.justify),
              ],
            ),
          );
        },
      ),
    );
  }
}
