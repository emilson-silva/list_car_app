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
                return ListTile(
                  leading: Image.asset(imageUri, width: 50, height: 50), // Exibe a imagem
                  title: Text('${car.nomeModelo} ${car.nomeModelo}'),
                  subtitle: Text('Ano: ${car.ano}, Combustível: ${car.combustivel}'),
                  trailing: Text('R\$ ${car.valor}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarDetailsView(car: car)),
                    );
                  },
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
