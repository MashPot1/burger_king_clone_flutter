List<Map<String, dynamic>> filterCategories(List<Map<String, dynamic>> catalog,
    List<Map<String, dynamic>> targetDishIds) {
  List<Map<String, dynamic>> filteredCategories = [];
  final date = DateTime.now();
  print(date);
  for (var category in catalog) {
    List<Map<String, dynamic>> filteredDishes = [];
    if (category['dish_ids'] != null) {
      for (var dishId in category['dish_ids']) {
        if (targetDishIds.contains(dishId)) {
          filteredDishes.add(dishId);
        }
      }
    }

    if (filteredDishes.isNotEmpty) {
      category['dish_ids'] = filteredDishes;
      filteredCategories.add(category);
    }
  }
  print(filteredCategories);
  return filteredCategories;
}
