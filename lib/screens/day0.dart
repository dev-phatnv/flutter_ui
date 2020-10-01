import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_v2/models/DshsModel.dart';

class DshsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách học sinh',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue[200],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString("assets/dssv.json"),
              builder: (context, snapshot) {
                var newData = json.decode(snapshot.data.toString());
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var id = newData[index]['id'];
                      var name = newData[index]['name'];
                      var age = newData[index]['age'];
                      var address = newData[index]['address'];
                      var avatar = newData[index]['avatar'];
                      return ListTile(
                        title: Text('$name'),
                        subtitle: Text('Age: $age\nAddress: $address'),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('$avatar'),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            var student = new DshsModel(id, name, age, address, avatar);
                            return DshsDetail(student: student);
                          }));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: newData == null ? 0 : newData.length);
              }),
        ),
      ),
    );
  }
}


class DshsDetail extends StatelessWidget {
 final DshsModel student;

  DshsDetail({Key key, @required this.student}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết học sinh', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)
        )),
        body: Column(
          children: <Widget>[
            Image.asset(student.avatar),
            Text(student.name),
            Text('Age: ${student.age} - Address: ${student.address}'),
          ],
        ),
      )
    );
  }
}