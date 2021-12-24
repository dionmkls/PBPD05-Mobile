import 'package:flutter/material.dart';

class DetailRS extends StatefulWidget {
  @override
  _DetailRSState createState() => _DetailRSState();
}

class _DetailRSState extends State<DetailRS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              // detail data
              
              // button
              TextButton(
                onPressed: onPressed,
                child: Text('Edit'),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}