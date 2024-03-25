
import 'package:http/http.dart' as http;

class StudentApiService{
  static Future<http.Response> getStudentsRequest() {
    return http.get(
      Uri.parse('http://localhost:5182/api/Student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }
}