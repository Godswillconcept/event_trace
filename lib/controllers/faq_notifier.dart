
import 'package:event_trace/models/Faq.dart';
import 'package:flutter/material.dart';

class FaqNotifier extends ChangeNotifier {
  List<Faq> faqList = [];

  // adding faq
  addFaq(Faq faq) {
    faqList.add(faq);
    notifyListeners();
  }

  // removing faq
  removeFaq(Faq faq) {
    faqList.remove(faq);
    notifyListeners();
  }

  // updating faq
  updateFaq(Faq faq) {
    faqList[faqList.indexOf(faq)] = faq;
    notifyListeners();
  }

  // loading faqs from server into the provider
  FaqNotifier.all(List<Faq> faqs) {
    faqList = faqs;
    notifyListeners();
  }
}