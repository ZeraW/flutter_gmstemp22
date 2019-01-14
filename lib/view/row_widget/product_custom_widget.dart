import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/view/screens/details_screen/project_details_screen.dart';

class ProductWidget extends StatelessWidget {
  var title, description, image, imageDetails;

  ProductWidget(
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
      onTap: ()=>navigate(context , title , description , image),
      child: Card(
        elevation: 5.0,
        child: Column(
          children: <Widget>[

            Expanded(
              flex: 3,
                child: Image.network(image)),
            Expanded(flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Text(title,style: TextStyle(fontSize: 16.0,)),
                ))
          ],
        ),
      ),
    );
  }



  void navigate(BuildContext context ,var title , var desc , var image){

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProjectDetails(title: title,description: desc,image: image,);

    }),);
    //Navigator.pop(context); this code work as back btn for this navigate
  }
}
