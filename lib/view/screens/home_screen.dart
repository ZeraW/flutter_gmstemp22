import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_gmstemp/constant_values.dart';
import 'package:flutter_gmstemp/view/screens/project_screen.dart';
import 'package:flutter_gmstemp/view/screens/service_screen.dart';

Color btnColors = Consts().mainColor;
Color textColor = Consts().textColor;
Color linesColor = Consts().linesColor;
Color colorssss = Consts().colorssss;

var _about_us = "About Us";
const _product = "Product";
const _service = "Service";
var _gallery = "Gallery";
const _project = "Project";
var _contact_us = "Contact Us";
var _client = "Client";
var _lang = "عربي";

final slider = Carousel(
  dotSize: 4.0,
  dotSpacing: 12.0,
  indicatorBgPadding: 8.0,
  dotColor: colorssss,
  images: [
    AssetImage('images/s01.png'),
    AssetImage('images/s02.png'),
    AssetImage('images/s03.png'),
  ],
);



class HomePage extends StatefulWidget {

  @override
  _BuildHomePage createState() {
    // TODO: implement createState
    return _BuildHomePage();
  }

}

class _BuildHomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: linesColor, child: sampleColumn(context));
  }

  Widget sampleRow(BuildContext context, String firstBtnTitle, String secondBtnTitle) {

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.only(right: 1.5, top: 3.0),
              color: btnColors,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  child: InkWell(
                    splashColor: colorssss,
                    highlightColor: colorssss,
                    onTap: () => navigate(context,firstBtnTitle),
                    child: Center(
                        child: Text(
                          firstBtnTitle,
                          style: TextStyle(color: textColor, fontSize: 20.0),
                        )),
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.only(left: 1.5, top: 3.0),
              color: btnColors,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  child: InkWell(
                    splashColor: colorssss,
                    highlightColor: colorssss,
                    onTap: () => navigate(context,secondBtnTitle),
                    child: Center(
                        child: Text(
                          secondBtnTitle,
                          style: TextStyle(color: textColor, fontSize: 20.0),
                        )),
                  ),
                ),
              )),
        )
      ],
    );
  }

  Widget sampleColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: slider,
          flex: 7,
        ),
        Expanded(
          child: sampleRow(context, _about_us, _product),
          flex: 2,
        ),
        Expanded(
          child: sampleRow(context, _service, _gallery),
          flex: 2,
        ),
        Expanded(
          child: sampleRow(context, _project, _contact_us),
          flex: 2,
        ),
        Expanded(
          child: sampleRow(context, _client, _lang),
          flex: 2,
        ),
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
                  "Develop by Digital Sigma",
                  style: TextStyle(color: textColor),
                )))
      ],
    );
  }

  void navigate(BuildContext context,String check){

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          switch(check){
            case _product:
              return ProjectScreen();
              break;
            case _project :
              return ProjectScreen();
              break;
            case _service :
              return ServiceScreen();
              break;


          }
        }),);
    //Navigator.pop(context); this code work as back btn for this navigate
  }

}

