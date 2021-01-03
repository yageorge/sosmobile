import 'package:http/http.dart' as http;
import 'dart:convert';

import '../sharedPrefs.dart';
import '../../models/course.dart';

class CoursesApi {
  final String token = sharedPrefs.userToken;

  // Get all courses allocated to the current user's department
  Future getCourses() async {
    try {
      final String url = "${sharedPrefs.apiUrl}usercourses";
      final response = await http.get(
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

  // Enroll current user to a course
  Future enrollToCourse(
    int userId,
    int courseId,
  ) async {
    try {
      final String url = "${sharedPrefs.apiUrl}enrollments";
      final response = await http.post(
        url,
        headers: {'Authorization': token},
        body: {
          'user_id': userId.toString(),
          'course_id': courseId.toString(),
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw 'A problem occurred: ${response.reasonPhrase}';
      }
    } catch (e) {
      throw 'Catch error enrollToCourse() $e';
    }
  }

  // Set Lecture isCompleted by current user
  Future toggleIsLectureCompleted(
    int userId,
    int lectureId,
    bool value,
  ) async {
    try {
      final String url = "${sharedPrefs.apiUrl}completions";
      dynamic response;
      if (value) {
        // If value == true : Set Lecture as completed
        response = await http.post(
          url,
          headers: {'Authorization': token},
          body: {
            'user_id': userId.toString(),
            'lecture_id': lectureId.toString(),
          },
        );
      } else {
        // If value == false : Set Lecture as inComplete
        final String deleteUrl = url + '/$lectureId';
        response = await http.delete(
          deleteUrl,
          headers: {'Authorization': token},
        );
      }
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw 'A problem occurred: ${response.reasonPhrase}';
      }
    } catch (e) {
      throw 'Catch error toggleIsLectureCompleted() $e';
    }
  }
}
