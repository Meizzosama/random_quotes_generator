import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_quotes_generator/quotes_screen/quotes_screen.dart';

import 'provider/quote_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Quote Generator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QuoteScreen(),
      ),
    );
  }
}
