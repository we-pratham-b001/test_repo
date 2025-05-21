import 'dart:convert';
import 'package:advicer/data/models/adivce_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImp extends AdviceRemoteDataSource {
  final http.Client client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    http.Response response = await client.get(
      Uri.parse('https://api.flutter-community.de/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return AdviceModel.formJson(data);

  }
}
