import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandowWordsState createState() => _RandowWordsState();
}

final _suggestions = <WordPair>[];
final _biggerFont = const TextStyle(fontSize: 18);

class _RandowWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

Widget _buildSuggestions() {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemBuilder: (context, i) {
      if (i.isOdd) {
        return const Divider();
      }
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    },
  );
}

Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
