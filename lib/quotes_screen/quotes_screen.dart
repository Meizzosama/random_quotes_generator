import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../provider/quote_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    Color getRandomColor() {
      final Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
        backgroundColor: Colors.teal.shade300,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.teal.shade100,
              Colors.blueAccent.shade100,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (quoteProvider.isLoading)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  )
                else
                  AnimatedOpacity(
                    opacity: quoteProvider.isLoading ? 0.0 : 1.0,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.yellow,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            quoteProvider.authorName,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.teal.shade700,
                                fontSize: screenSize.width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            quoteProvider.quote,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.teal.shade900,
                                fontSize: screenSize.width * 0.07,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    quoteProvider.getRandomQuote();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          getRandomColor(),
                          getRandomColor(),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Get a New Quote',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
