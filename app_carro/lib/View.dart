import 'package:app_carro/Controller.dart';
import 'package:app_carro/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Meus Carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          //Lista os Carros da Lista
          Consumer<CarroController>(
            builder: (context, model, child) {
              return ListView.builder(
                itemCount: model.listarCarros.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // Exibe os Carros Listados no Controller
                    title: Text(model.listarCarros[index].modelo),
                    //quando clicado o carro vai abrir a telaDescricaoCarro
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaDetalheCarro(model.listarCarros[index]),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarCarros(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nomeController = TextEditingController();
        TextEditingController anoController = TextEditingController();
        TextEditingController urlController = TextEditingController();

        return AlertDialog(
          title: Text('Adicionar Novo Carro'),
          content: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome do Carro'),
              ),
              TextField(
                controller: anoController,
                decoration: InputDecoration(labelText: 'Ano do Carro'),
              ),
              TextField(
                controller: urlController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Access the provider and call the method
                Provider.of<CarroController>(context, listen: false)
                    .adicionarCarro(
                  nomeController.text,
                  (int.tryParse(anoController.text) != null) as int,
                  urlController.text,
                );

                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}

class TelaDetalheCarro extends StatelessWidget {
  final Carro carro;
  const TelaDetalheCarro(this.carro);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Carro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(carro.imagemUrl),
            SizedBox(height: 20),
            Text("Modelo: ${carro.modelo}"),
            Text("Ano: ${carro.ano}"),
          ],
        ),
      ),
    );
  }
}
