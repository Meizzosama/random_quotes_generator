import 'dart:convert';
import 'package:http/http.dart' as http;

class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'],
      author: json['originator']['name'] ?? 'Unknown Author',
    );
  }
}

class QuoteService {
  final String apiUrl = "https://quotes15.p.rapidapi.com/quotes/random/";
  final String apiKey = "8c358ff794msh23a2b996d791a83p130f89jsnf7831d1387e9";

  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": "quotes15.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(response.body);
      return Quote.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
