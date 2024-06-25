import 'package:flutter/material.dart';
import 'package:list_car_app/controller/car_controller.dart';
import 'package:list_car_app/model/car_model.dart';
import 'package:list_car_app/shared/utils/assets.dart';

class CarDetailsView extends StatelessWidget {
  final Car car;
  final CarController _controller = CarController();
  final TextEditingController _controllerTextField = TextEditingController();

  CarDetailsView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
     // Aqui você obtém a URI do asset baseado no campo do modelo Car
    final String carAssetUri = CarAssets.values[car.id % CarAssets.values.length].localUri;

    return Scaffold(
      appBar: AppBar(
        title: Text('${car.nomeModelo} ${car.nomeModelo}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibindo a imagem do carro
            Image.asset(carAssetUri, height: 200), // Ajuste a altura conforme necessário
            Text('Modelo: ${car.nomeModelo}', style: const TextStyle(fontSize: 18)),
            Text('Preço: R\$ ${car.valor}', style: const TextStyle(fontSize: 18)),
            Text('Ano: ${car.ano}', style: const TextStyle(fontSize: 18)),
            Text('Combustível: ${car.combustivel}', style: const TextStyle(fontSize: 18)),
            Text('Portas: ${car.numPortas}', style: const TextStyle(fontSize: 18)),
            Text('Cor: ${car.cor}', style: const TextStyle(fontSize: 18)),
            TextField(
              controller: _controllerTextField,
              decoration: const InputDecoration(labelText: 'Seu email ou telefone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _controller.saveLead(car.id, _controllerTextField.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lead salvo com sucesso!')),
                );
              },
              child: const Text('Eu Quero'),
            ),
          ],
        ),
      ),
    );
  }
}
