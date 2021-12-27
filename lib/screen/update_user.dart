import 'package:crud_application/api/api.dart';
import 'package:crud_application/config/button.dart';
import 'package:crud_application/config/color.dart';
import 'package:flutter/material.dart';

import 'all_user.dart';

class UpdateUserView extends StatelessWidget {

  var name = TextEditingController();
  var job = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25,top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Image.asset(
                  'assets/img.png',
                  height: 150,
                ),
              ),
              //Name
              TextFormField(
                controller: name,
                style: TextStyle(fontSize: 20, color: Color(0xFF777878)),
                autofillHints: [AutofillHints.name],
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Your Name *',
                  hintText: 'Enter Your Name',
                  fillColor: Color(0xFFffffff),
                  filled: true,
                  labelStyle: TextStyle(fontSize: 16),
                  hintStyle: TextStyle(fontSize: 16),
                  prefixIcon: Icon(Icons.account_circle),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: colors,
                        width: 2
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: bodyColor,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: 10, left: 20),
                  //suffixIcon: name.text.length > 0 ? Icon(Icons.done) : Icon(Icons.pin)
                ),
              ),

              //Job
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: TextFormField(
                  controller: job,
                  style: TextStyle(fontSize: 20, color: Color(0xFF777878)),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Your Job *',
                    hintText: 'Enter Your Job',
                    fillColor: Color(0xFFffffff),
                    filled: true,
                    labelStyle: TextStyle(fontSize: 16),
                    hintStyle: TextStyle(fontSize: 16),
                    prefixIcon: Icon(Icons.account_circle),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: colors,
                          width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: bodyColor,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 20),
                    //suffixIcon: name.text.length > 0 ? Icon(Icons.done) : Icon(Icons.pin)
                  ),
                ),
              ),

              //Save
              Button.FlatButton(
                text: 'Update User',
                press: (){
                  if(name.text != '' && job.text != ''){
                    UpdateUser(name.text, job.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Successfully Updated"),
                      backgroundColor: Colors.blue,
                    ));
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllUserView(),
                    ));
                  }
                  else if(name.text == ''){
                    return showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Please Enter a Name'),
                      );
                    });
                  }

                  else if(job.text == ''){
                    return showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Please Enter Job'),
                      );
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}