import 'package:http/http.dart' as http;
import 'dart:convert';

import '../sharedPrefs.dart';
import '../../models/course.dart';

class CoursesApi {
  final String url = "${sharedPrefs.apiUrl}courses";
  final String token = sharedPrefs.userToken;
  // Future<List<Course>>
  Future getCourses() async {
    try {
      var response = await http.get(
        url,
        headers: {'Authorization': token},
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw 'A problem occurred: ${response.reasonPhrase}';
      }
    } catch (e) {
      throw 'Catch error getCourses() $e';
    }
  }
}
