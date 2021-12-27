import 'dart:async';
import 'package:crud_application/model/all_user_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'https://reqres.in';

Future AllUser() async{
  var url = '$baseUrl/api/users';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    AllUsersModel usersModel = allUsersModelFromMap(response.body);

    List<Datum> userData = usersModel.data;

    return userData;
  }
}

Future CreateUser(name, job) async {
  var url = '$baseUrl/api/users';
  var response = await http.post(Uri.parse(url), body: {
    'name': name,
    'job': job
  });

  if(response.statusCode == 201){
    print('Create Success');
  }
  else{
    print('Create Error');
  }
}

Future UpdateUser(name, job) async {
  var url = '$baseUrl/api/users/2';
  var response = await http.put(Uri.parse(url), body: {
    'name': name,
    'job': job
  });

  if(response.statusCode == 200){
    print('Update Success');
  }
  else{
    print('Error');
  }
}

Future deleteUser(BuildContext context) async {
  var url = '$baseUrl/api/users/2';
  var response = await http.delete(Uri.parse(url), body: {
  });

  if(response.statusCode == 204){
    print('Deleted Successfully');
  }
  else{
    print('Error');
  }
}