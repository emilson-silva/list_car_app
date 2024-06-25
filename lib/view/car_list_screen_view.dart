import 'package:flutter/material.dart';
import 'package:list_car_app/controller/car_controller.dart';
import 'package:list_car_app/model/car_model.dart';
import 'package:list_car_app/shared/utils/assets.dart';
import 'package:list_car_app/view/car_details_view.dart';

class CarListScreenView extends StatefulWidget {
  const CarListScreenView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarListScreenViewState createState() => _CarListScreenViewState();
}

class _CarListScreenViewState extends State<CarListScreenView> {
  late Future<List<Car>> futureCars;
  final CarController _controller = CarController();

  @override
  void initState() {
    super.initState();
    futureCars = _controller.fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carros Disponíveis'),
      ),
      body: FutureBuilder<List<Car>>(
        future: futureCars,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Car car = snapshot.data![index];
                // Calcula o índice da imagem baseado no ID do carro
                int imageIndex = car.id % CarAssets.values.length;
                // Obtém a URI da imagem
                String imageUri = CarAssets.values[imageIndex].localUri;
                return Container(
                  padding: const EdgeInsets.all(
                      8.0), // Adiciona um padding ao redor do container
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailsView(car: car),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(
                          8.0), // Adiciona um padding ao redor do container
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imageUri,
                            width: 50,
                            height: 50,
                          ), // Exibe a imagem
                          const SizedBox(
                              width: 10), // Espaço entre a imagem e o texto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Alinha os textos à esquerda
                              children: [
                                Text('${car.nomeModelo} ${car.nomeModelo}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    'Ano: ${car.ano}, Combustível: ${car.combustivel}'),
                              ],
                            ),
                          ),
                          Text('R\$ ${car.valor}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
