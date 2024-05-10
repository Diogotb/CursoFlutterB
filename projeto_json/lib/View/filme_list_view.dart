import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/filmes_controller.dart';

class FilmesListScreen extends StatefulWidget {
  const FilmesListScreen({super.key});

  @override
  State<FilmesListScreen> createState() => _FilmesListScreenState();
}

class _FilmesListScreenState extends State<FilmesListScreen> {
  //atributo
  FilmesController _controller = new FilmesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Filmes"),
        ),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Expanded(
                child: FutureBuilder(
                    future: _controller.loadFilmesfromJson(),
                    builder: (context, snapshot) {
                      if (_controller.listFilmes.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: _controller.listFilmes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Image.file(File(
                                      _controller.listFilmes[index].imagem)),
                                  title:
                                      Text(_controller.listFilmes[index].nome),
                                  subtitle: Text(
                                      _controller.listFilmes[index].genero),
                                  onTap: () {});
                            });
                      }
                    }))));
  }
}
