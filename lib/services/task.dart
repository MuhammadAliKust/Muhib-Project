import 'dart:convert';

import 'package:api_project/models/task.dart';
import 'package:api_project/models/task_listing.dart';
import 'package:http/http.dart' as http;

class TaskServices {
  ///Create Task
  Future<TaskModel> createTask({
    required String token,
    required String description,
  }) async {
    http.Response response = await http.post(
      Uri.parse("{{TODO_URL}}/todos/add"),
      headers: {"Content-Type": "application/json", "Authorization": token},
      body: jsonEncode({"description": description}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get All Task
  Future<TaskListingModel> getAllTask(String token) async {
    http.Response response = await http.get(
      Uri.parse("{{TODO_URL}}/todos/get"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TaskListingModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get Completed Task
  Future<TaskListingModel> getCompletedTask(String token) async {
    http.Response response = await http.get(
      Uri.parse("{{TODO_URL}}/todos/completed"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TaskListingModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get InCompleted Task
  Future<TaskListingModel> getInCompletedTask(String token) async {
    http.Response response = await http.get(
      Uri.parse("{{TODO_URL}}/todos/incomplete"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TaskListingModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Update Task
  Future<bool> updateTask({
    required String token,
    required String description,
    required String taskID,
  }) async {
    http.Response response = await http.put(
      Uri.parse("{{TODO_URL}}/todos/update/$taskID"),
      headers: {"Content-Type": "application/json", "Authorization": token},
      body: jsonEncode({"description": description}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Delete Task
  Future<bool> deleteTask({
    required String token,
    required String taskID,
  }) async {
    http.Response response = await http.delete(
      Uri.parse("{{TODO_URL}}/todos/delete/$taskID"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Search Task
  Future<TaskListingModel> searchTask({
    required String token,
    required String searchKey,
  }) async {
    http.Response response = await http.get(
      Uri.parse("{{TODO_URL}}/search?keywords=$searchKey"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TaskListingModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }
}
