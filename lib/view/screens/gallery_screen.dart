import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/requests/gallery_request.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF1D4793),
          title: Text("Gallery"),
        ),
        body: ResponseGallery());
  }

}