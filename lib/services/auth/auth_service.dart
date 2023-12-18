import 'package:dio/dio.dart';
import 'package:leadx/constants.dart';

class AuthService {
  Future<Map<String, dynamic>?> signin(String mobileNumber) async {
    Dio dio = Dio();

    final response = await dio
        .post("${Constants.baseUrl}/login", data: {"mobile": mobileNumber});

    print("response.data : ${response.data}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return null;
  }

  Future<Map<String, dynamic>?> signup(Map<String, dynamic> data) async {
    Dio dio = Dio();

    print("response.data : $data");
    try {
      final response = await dio.post(
        "${Constants.baseUrl}/register",
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      print("response.data : ${response.data}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("error : $e");
    }
    return null;
  }
}
