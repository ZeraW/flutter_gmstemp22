import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/requests/project_request.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF1D4793),
        title: Text("Projects"),
    ),
    body: ResponseProject());
  }

}