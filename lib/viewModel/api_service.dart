import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';

class ApiService {
  static const baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}categories.php'));
    final data = json.decode(response.body);
    return (data['categories'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  static Future<List<Meal>> fetchMealsByCategory(String category) async {
    final response = await http.get(Uri.parse('${baseUrl}filter.php?c=$category'));
    final data = json.decode(response.body);
    return (data['meals'] as List)
        .map((json) => Meal.fromJson(json))
        .toList();
  }

  static Future<Meal> fetchMealDetail(String id) async {
    final response = await http.get(Uri.parse('${baseUrl}lookup.php?i=$id'));
    final data = json.decode(response.body);
    return Meal.fromJson(data['meals'][0]);
  }
}
