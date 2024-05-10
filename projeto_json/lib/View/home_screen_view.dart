import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mundo do Cinema'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/list"),
              child: const Text("Lista de Filmes")),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/cadastro"), 
              child: const Text("Cadastro de Filmes")),

        ],),
      ),
    );
  }
}