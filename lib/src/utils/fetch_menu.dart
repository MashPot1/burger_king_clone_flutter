import 'package:dio/dio.dart';

import 'find_dishes_by_id.dart';
import 'filter_categories.dart';

Future fetchMenu() async {
  final dio = Dio();
  var url = 'https://orderapp.burgerkingrus.ru/api/v1/menu';
  Map<String, int> restaurantDishes;
  List<Map<String, dynamic>> dishes;
  List<Map<String, dynamic>> catalog;

  try {
    var responseRestaurant = await dio.get('$url/getMenu?restaurant=217');
    var responseDishes = await dio.get('$url/dishes');
    var responseCatalog = await dio.get('$url/catalog');

    if (responseRestaurant.statusCode == 200) {
      catalog = List<Map<String, dynamic>>.from(
          responseCatalog.data['response']['categories']);
      restaurantDishes =
          Map<String, int>.from(responseRestaurant.data['response']['dishes']);
      dishes = List<Map<String, dynamic>>.from(
          responseDishes.data['response']['dishes']);
      dishes = findDishesById(restaurantDishes, dishes);
      catalog = filterCategories(catalog, dishes);
      return findDishesById(restaurantDishes, dishes);
    } else {
      print('Request failed with status: ${responseRestaurant.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
