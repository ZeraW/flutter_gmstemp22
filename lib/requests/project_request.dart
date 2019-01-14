import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/requests/model/project_model.dart';
import 'package:flutter_gmstemp/view/row_widget/product_custom_widget.dart';
import 'package:http/http.dart' as http;

Future<List<Project>> fetchData() async {
  var url = "http://gms-sms.com:89/gmsred/api/projects";
  var imgUrl = "http://gms-sms.com:89";

  final response = await http.get(url, headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  });

  if (response.statusCode == 200) {
    print("object 200");
    List<Project> mList = [];
    var jsonData = json.decode(response.body);
    var data = jsonData['data'];

    print(jsonData);
    // If the call to the server was successful, parse the JSON
    for (var project in data) {
      var title = project['en_name'];
      var description = project['en_description'];
      var image = imgUrl + project['logo'];

      mList.add(Project(title, description, image));
    }

    return mList;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class ResponseProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getFuture = FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("object has data");
          return Container(
            color: Colors.white70,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildListViewWidgets(snapshot.data),
          );
        } else if (snapshot.hasError) {
          print("object error");
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner
        return CircularProgressIndicator();
      },
    );

    return Center(
      child: getFuture,
    );
  }

  Widget _buildListViewWidgets(List<Project> projects) {
    return GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) => ProductWidget(
            title: projects[index].title,
            description: projects[index].description,
            image: projects[index].image,
          ),
      itemCount: projects.length,
    );
  }
}
