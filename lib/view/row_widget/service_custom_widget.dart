import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/constant_values.dart';
import 'package:flutter_gmstemp/view/screens/details_screen/project_details_screen.dart';

class ServiceWidget extends StatelessWidget {
  var title, description, image, imageDetails;

  ServiceWidget(
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
    return InkWell(
      onTap: () => navigate(context, title, description, image),
      child: Padding(
        padding: const EdgeInsets.only(top:2.0,bottom: 2.0),
        child: Card(
          color: Consts().serviceRow,
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 10.0),
              leading: Container(
                padding: EdgeInsets.all(3.0),
                color: Consts().serviceImg,
                      width: 70.0, height: 70.0, child: Image.network(image)),
              title:  Text(title,
                        style: TextStyle(
                          fontSize: 18.0,color: Colors.white
                        ),
                  ),trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }


  void navigate(BuildContext context, var title, var desc, var image) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProjectDetails(
          title: title,
          description: desc,
          image: image,
        );
      }),
    );
    //Navigator.pop(context); this code work as back btn for this navigate
  }
}
