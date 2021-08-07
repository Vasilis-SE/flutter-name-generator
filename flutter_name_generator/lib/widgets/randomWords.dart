import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _saved = <WordPair>{};
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: 'Verdana');

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length)
            _suggestions.addAll(generateWordPairs().take(10));

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair randoName) {
    final alreadySaved = _saved.contains(randoName);

    return ListTile(
      title: Text(
        randoName.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved)
            _saved.remove(randoName);
          else
            _saved.add(randoName);
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            final tiles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(pair.asPascalCase, style: _biggerFont),
                  trailing: Icon(
                    Icons.highlight_remove_outlined,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      _saved.remove(pair);
                    });
                  },
                );
              },
            );

            final divided = tiles.isNotEmpty
                ? ListTile.divideTiles(context: context, tiles: tiles).toList()
                : <Widget>[];

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
                backgroundColor: Colors.orange.shade100,
              ),
              body: ListView(children: divided),
            );
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Startup Name Generator'),
        backgroundColor: Colors.orange.shade100,
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
      ),
      body: _buildSuggestions(),
    );
  }
}
