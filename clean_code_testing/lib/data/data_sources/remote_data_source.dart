import 'dart:convert';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/adivce_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImp extends AdviceRemoteDataSource {
  AdviceRemoteDataSourceImp({required this.client});
  final http.Client client;
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    http.Response response = await client.get(
      Uri.parse('https://api.flutter-community.de/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      return AdviceModel.formJson(data);
    }
  }
}
