import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/constant_values.dart';

class ProjectDetails extends StatelessWidget {
  var title, description, image, imageDetails;

  ProjectDetails(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.image,
      this.imageDetails})
      : assert(title != null),
        assert(description != null),
        assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidget = Container(
      child: Image.network(image),
    );
    final textWidget = Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 20.0),
      ),
    );
    return Scaffold(
        appBar: AppBar(
            title: Text(title), backgroundColor: Consts().mainColor),
        body: Column(
          children: <Widget>[
            Expanded(
              child: imageWidget,
              flex: 4,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[textWidget],
              ),
              flex: 6,
            )
          ],
        ));
  }
}
