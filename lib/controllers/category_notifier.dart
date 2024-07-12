
import 'package:event_trace/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  List<Category> categoryList = [];

  // adding category
  addCategory(Category category) {
    categoryList.add(category);
    notifyListeners();
  }

  // removing category
  removeCategory(Category category) {
    categoryList.remove(category);
    notifyListeners();
  }

  // updating category
  void updateCategory(Category updatedCategory) {
    final index = categoryList.indexWhere((category) => category.id == updatedCategory.id);
    if (index != -1) {
      categoryList[index] = updatedCategory;
      notifyListeners();
    }
  }

  // loading categorys from server into the provider
  CategoryNotifier.all(List<Category> categorys) {
    categoryList = categorys;
    notifyListeners();
  }
}
