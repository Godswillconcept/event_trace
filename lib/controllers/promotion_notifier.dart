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
  updatePromotion(Promotion promotion) {
    promotionList[promotionList.indexOf(promotion)] = promotion;
    notifyListeners();
  }

  // loading promotions from server into the provider
  PromotionNotifier.all(List<Promotion> promotions) {
    promotionList = promotions;
    notifyListeners();
  }
}
