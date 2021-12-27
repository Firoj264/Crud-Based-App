import 'package:crud_application/api/api.dart';
import 'package:crud_application/config/button.dart';
import 'package:crud_application/config/red_button.dart';
import 'package:crud_application/screen/update_user.dart';
import 'package:flutter/material.dart';

import 'all_user.dart';

class Profile extends StatelessWidget {
  var avatar, fName, lName, email;
  Profile(this.avatar, this.fName, this.lName, this.email);

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Are you sure you want to delete this user?'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => {
                      deleteUser(context),
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Successfully Updated"), backgroundColor: Colors.blue,
                      )),
                      Navigator.of(context).push(
                     MaterialPageRoute(
                    builder: (BuildContext context) => AllUserView(),
                  ),
                ),
              }),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$fName Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:38.0,left: 20,right: 20),
          child: Column(
            children: [
              ClipOval(
                child: Image(image: NetworkImage(avatar),height: 180,width: 180,fit: BoxFit.cover,),
              ),
              SizedBox(height: 20,),
              Text('First Name: $fName',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text('Last Name: $lName',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text('Email: $email',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Button.FlatButton(
                text: 'Update User',
                press: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdateUserView(),
                  ));
                },
              ),
              SizedBox(height: 20,),
              RedButton.FlatButton(
                text: 'Delete User',
                press: (){
                  confirmDelete(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}