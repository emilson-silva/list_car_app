import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_car_app/model/car_model.dart';
import 'package:list_car_app/model/database_helper.dart';


class CarController {
  Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse('https://wswork.com.br/cars.json'));

    if (response.statusCode == 200) {
  final decodedResponse = json.decode(response.body);
  List<dynamic> carsList = decodedResponse['cars'];
  return carsList.map((car) => Car.fromJson(car)).toList();
} else {
  throw Exception('Failed to load cars');
}
  }

  Future<void> saveLead(int carId, String userInfo) async {
    await DatabaseHelper().insertLead(carId, userInfo);
  }

  Future<void> sendLeads() async {
    final leads = await DatabaseHelper().getLeads();

    if (leads.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://www.wswork.com.br/cars/leads'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(leads),
      );

      if (response.statusCode == 200) {
        await DatabaseHelper().deleteLeads();
      } else {
        throw Exception('Failed to send leads');
      }
    }
  }
}
