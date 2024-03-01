import 'package:app_carro/Model.dart';
import 'package:flutter/material.dart';

class CarroController extends ChangeNotifier{
  List<Carro> _carroList = [
    Carro("Fiat Uno", 1992, ""),
    Carro("Classic", 2005, "")
  ];
  //get
  List<Carro> get listarCarros => _carroList;

  void adicionarCarro(String modelo,int ano, String imagemUrl){
    // crie um obj
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroList.add(carro);
    notifyListeners();
  }
}