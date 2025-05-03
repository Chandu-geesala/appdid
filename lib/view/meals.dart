import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../viewModel/api_service.dart';
import 'meal_detail.dart';


class MealsPage extends StatelessWidget {
  final String category;
  MealsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Meals')),
      body: FutureBuilder<List<Meal>>(
        future: ApiService.fetchMealsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData) return Center(child: Text('No meals'));

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ListTile(
                leading: Image.network(meal.thumbnail, width: 50),
                title: Text(meal.name),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MealDetailPage(mealId: meal.id)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
