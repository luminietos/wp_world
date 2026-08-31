import 'package:flutter/material.dart';
import 'package:wp_world/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: const Center(child: Text("Home Page")),
    );
  }
}
