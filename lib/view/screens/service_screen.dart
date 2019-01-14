import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/constant_values.dart';
import 'package:flutter_gmstemp/requests/service_request.dart';

class ServiceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Consts().mainColor,
          title: Text("Services"),
        ),
        body: ResponseService());
  }

}