import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

//Using abstract class it's possible to protect the code from external changes for example
void main() {
  /*
  Because of the abstract class we can use dependency inversion and
  pass the HttpService or DioService instance to the consume method.
  */
  consume(HttpService());
  consume(DioService());
}

//Abstract class that will define the fetchJson contract method
abstract class JsonService {
  Future<Map> fetchJson();
}

//Function that will consume the fetchJson method from the given JsonService
void consume(JsonService service) async {
  final data = await service.fetchJson();
  print(data);
}

//HttpService class that will implement the fetchJson method usin Http
class HttpService implements JsonService {
  @override
  Future<Map> fetchJson() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );
    return jsonDecode(response.body);
  }
}

//DioService class that will implement the fetchJson method usin Dio
class DioService implements JsonService {
  final Dio dio = Dio();

  @override
  Future<Map> fetchJson() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  }
}
