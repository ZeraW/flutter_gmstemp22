import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/requests/model/gallery_model.dart';
import 'package:http/http.dart' as http;

Future<GalleryModel> fetchData() async {
  var url = "http://gms-sms.com:89/gmsred/api/galleries";
  var imgUrl = "http://gms-sms.com:89";

  final response = await http.get(url, headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  });

  if (response.statusCode == 200) {
    print("object 200");

    var jsonData = json.decode(response.body);
    GalleryModel model = new GalleryModel.fromJson(jsonData);

    print(model.images[0].image);

    return model;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class ResponseGallery extends StatelessWidget {
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

  Widget _buildListViewWidgets(GalleryModel model) {
    return GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) => Container(
            child: Image.network(model.images[index].image,fit: BoxFit.cover),
        padding: EdgeInsets.all(5.0),
          ),
      itemCount: model.images.length,
    );
  }
}
