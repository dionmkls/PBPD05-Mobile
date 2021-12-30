import 'package:flutter/material.dart';
import 'page/vaksin_index.dart';

void main() => runApp(MaterialApp(
      home: Vaksin(),
    ));

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBP D-05'),
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
