import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/constant_values.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactUsWidget extends StatelessWidget {
  var check, title, details, image;

  ContactUsWidget(
      {Key key,
      @required this.check,
      @required this.title,
      @required this.details,
      @required this.image})
      : assert(check != null),
        assert(title != null),
        assert(details != null),
        assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => navigate(context, check, title, details, image),

        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 10.0),
              leading: Container(
                  margin: EdgeInsets.only(left: 15.0,right: 10.0),
                  width: 40.0,
                  height: 40.0,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(image),
                  )),
              title: Text(
                title,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
          ),
        ),

    );
  }

  void navigate(
      BuildContext context, var check, var title, var desc, var image) {
    print("object");
    switch (check) {
      case Consts.phone:
        UrlLauncher.launch("tel://$desc");
        break;
      case Consts.url:
        _launchURL(desc);
    }
  }

  _launchURL(var url) async {

    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
}
}
