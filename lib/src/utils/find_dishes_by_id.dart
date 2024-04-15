List<Map<String, dynamic>> findDishesById(
    Map<String, int> restaurantDishes, List<Map<String, dynamic>> dishes) {
  List<Map<String, dynamic>> result = [];

  for (Map<String, dynamic> dish in dishes) {
    if (dish.containsKey('id')) {
      int id = dish['id']!;
      if (restaurantDishes.containsKey(id.toString())) {
        Map<String, dynamic> newDish = Map<String, dynamic>.from(
            dish); // Клонируем существующий объект, чтобы не изменять оригинальный
        newDish['price'] = restaurantDishes[id.toString()]! /
            100; // Добавляем новое свойство "price", поделив значение на 100
        result.add(newDish);
      }
    }
  }

  return result;
}
