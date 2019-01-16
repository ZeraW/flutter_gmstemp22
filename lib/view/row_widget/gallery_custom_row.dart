import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }



  void navigate(BuildContext context ,var title , var desc , var image){
/*
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProjectDetails(title: title,description: desc,image: image,);

    }),);*/
    //Navigator.pop(context); this code work as back btn for this navigate
  }
}
