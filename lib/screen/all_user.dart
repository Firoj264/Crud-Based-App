import 'package:crud_application/api/api.dart';
import 'package:crud_application/screen/profile.dart';
import 'package:flutter/material.dart';
import 'create_user.dart';

class AllUserView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All User'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: AllUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }

          else if (snapshot.hasError){
            return Text('Something Wrong');
          }

          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(snapshot.data[index].avatar, snapshot.data[index].firstName,
                          snapshot.data[index].lastName, snapshot.data[index].email
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image(image: NetworkImage(snapshot.data[index].avatar)),
                          title: Text('${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),
                          subtitle: Text(snapshot.data[index].email),
                        ),
                      ),
                    ),
                  );
                }
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => CreateUserView(),
          ),
        ),
      ),
    );
  }
}