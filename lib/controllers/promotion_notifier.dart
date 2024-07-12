import 'package:event_trace/models/Promotion.dart';
import 'package:flutter/material.dart';

class PromotionNotifier extends ChangeNotifier {
  List<Promotion> promotionList = [];

  // adding promotion
  addPromotion(Promotion promotion) {
    promotionList.add(promotion);
    notifyListeners();
  }

  // removing promotion
  removePromotion(Promotion promotion) {
    promotionList.remove(promotion);
    notifyListeners();
  }

  // updating promotion
  void modifyPromotion(Promotion updatedPromotion) {
    final index = promotionList.indexWhere((promotion) => promotion.id == updatedPromotion.id);
    if (index != -1) {
      promotionList[index] = updatedPromotion;
      notifyListeners();
    }
  }

  // loading promotions from server into the provider
  PromotionNotifier.all(List<Promotion> promotions) {
    promotionList = promotions;
    notifyListeners();
  }
}
