import 'package:flutter_gmstemp/constant_values.dart';

class GalleryModel {
  final List<Imagex> images;

  GalleryModel({this.images});

  factory GalleryModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Imagex> imagesList = list.map((i) => Imagex.fromJson(i)).toList();

    return new GalleryModel(images: imagesList);
  }
}

class Imagex {
  String image;

  Imagex({this.image});

  factory Imagex.fromJson(Map<String, dynamic> parsedJson) {
    return Imagex(
      image: Consts.imageUrl + parsedJson['image'],
    );
  }
}
