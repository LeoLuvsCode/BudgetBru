// lib/widgets/jozi_boet_chat.dart
import 'dart:math'; // Add this for Random()
import 'package:flutter/material.dart';

class JoziBoetChat extends StatefulWidget {  // Changed to StatefulWidget
  const JoziBoetChat({super.key});

  @override
  State<JoziBoetChat> createState() => _JoziBoetChatState();
}

class _JoziBoetChatState extends State<JoziBoetChat> {
  final List<String> joziTips = [
    "Eish, bru! You spent R500 on takeaways this month!",
    "Lekker! You saved 20% this week!",
    "Check out this free concert at Neelsie!"
  ];

  String _currentTip = "";

  @override
  void initState() {
    super.initState();
    _refreshTip();
  }

  void _refreshTip() {
    setState(() {
      _currentTip = joziTips[Random().nextInt(joziTips.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Jozi Boet says:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                )),
            Text(_currentTip),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshTip,
            ),
          ],
        ),
      ),
    );
  }
}