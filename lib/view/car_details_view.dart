import 'package:flutter/material.dart';
import 'package:list_car_app/controller/car_controller.dart';
import 'package:list_car_app/model/car_model.dart';
import 'package:list_car_app/shared/utils/assets.dart';

class CarDetailsView extends StatefulWidget {
  final Car car;

  const CarDetailsView({super.key, required this.car});

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  final CarController _controller = CarController();
  final TextEditingController _controllerTextField = TextEditingController();
  final ValueNotifier<bool> _isInputValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controllerTextField.addListener(_validateInput);
  }

 @override
  void dispose() {
    _controllerTextField.removeListener(_validateInput);
    _controllerTextField.dispose();
    _isInputValid.dispose();
    super.dispose();
  }

  void _validateInput() {
    final input = _controllerTextField.text;
    final isEmailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);
    final isPhoneValid = RegExp(r'^(?:[+0]9)?[0-9]{11}$').hasMatch(input);
    _isInputValid.value = isEmailValid || isPhoneValid;
  }

  @override
  Widget build(BuildContext context) {
    // Aqui você obtém a URI do asset baseado no campo do modelo Car
    final String carAssetUri =
        CarAssets.values[widget.car.id % CarAssets.values.length].localUri;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.car.nomeModelo} ${widget.car.nomeModelo}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // Cor da borda
                    width: 2, // Espessura da borda
                  ),
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // Raio da borda para cantos arredondados
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exibindo a imagem do carro
                    Image.asset(carAssetUri,
                        height: 200), // Ajuste a altura conforme necessário
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Modelo: ${widget.car.nomeModelo}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Preço: R\$ ${widget.car.valor}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Ano: ${widget.car.ano}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Combustível: ${widget.car.combustivel}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Portas: ${widget.car.numPortas}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Cor: ${widget.car.cor}',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _controllerTextField,
                    decoration: const InputDecoration(
                      labelText: 'Seu email ou telefone',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, // Cor da borda
                          width: 2.0, // Espessura da borda
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                valueListenable: _isInputValid,
                builder: (context, isInputValid, child) {
                  return ElevatedButton(
                    onPressed: isInputValid
                        ? () {
                            _controller.saveLead(widget.car.id, _controllerTextField.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Lead salvo com sucesso!')),
                            );
                          }
                        : null,
                    child: const Text('Eu Quero'),
                  );
                },
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
