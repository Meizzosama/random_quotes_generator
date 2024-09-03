import 'package:flutter/material.dart';
import '../services/quote_service.dart';

class QuoteProvider with ChangeNotifier {
  String _quote = "Click the button to get a random quote!";
  String _authorName = "Author's Name";
  bool _isLoading = false;

  String get quote => _quote;
  String get authorName => _authorName;
  bool get isLoading => _isLoading;

  void getRandomQuote() async {
    _isLoading = true;
    notifyListeners();

    try {
      Quote newQuote = await QuoteService().fetchRandomQuote();
      _quote = newQuote.content;
      _authorName = newQuote.author;
    } catch (e) {
      _quote = "Failed to fetch quote.";
      _authorName = "Unknown Author";
    }

    _isLoading = false;
    notifyListeners();
  }
}
