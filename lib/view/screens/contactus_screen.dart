import 'package:flutter/material.dart';
import 'package:flutter_gmstemp/requests/model/contactus_model.dart';
import 'package:flutter_gmstemp/view/row_widget/contactus_custom_widget.dart';
import 'package:flutter_gmstemp/view/screens/maps.dart';
import 'package:flutter_gmstemp/constant_values.dart';

class ContactUsScreen extends StatelessWidget {
  List<ContactUsModel> contactList = [];
  String address = "(66) Al-Mehwar Al-Markazy -district 10- neighborhood (2) - 6th October 4th Floor (4)-Giza-Egypt.";
  String addressUrl = "https://www.google.com.eg/maps/place/GMS+Group/@29.9602707,30.9164993,17z/data=!3m1!4b1!4m5!3m4!1s0x14585612acea8d71:0xb03efb016a419bb4!8m2!3d29.9602707!4d30.918688";

  String facebookName = "GMS Group";
  String facebookUrl = "http://fb.me/GMS.Group.Company/";


  @override
  Widget build(BuildContext context) {
    //map
    contactList.add(ContactUsModel(Consts.url, address, addressUrl, 'images/google_maps.png'));
    //phne
    contactList.add(ContactUsModel(Consts.phone, "(+202) 36864622",
        "0236864622", 'images/phone_receiver.png'));
    //facebook
    contactList.add(ContactUsModel(Consts.url, facebookName,
        facebookUrl, 'images/facebook.png'));
    //mail
    contactList.add(ContactUsModel(Consts.url, "info@gms-group.company",
        "mailto:info@gms-group.company", 'images/email.png'));
    //site
    contactList.add(ContactUsModel(Consts.url, "www.gms-group.company",
        "http://www.gms-group.company/", 'images/grid_world.png'));
    




    // TODO: implement build
    return Scaffold(
      backgroundColor: Consts().background,
      appBar: AppBar(
        backgroundColor: Color(0xFF1D4793),
        title: Text("Contact Us"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: MapsDisplay(),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: _buildListViewWidgets(contactList),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListViewWidgets(List<ContactUsModel> mList) {
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext context, int index) => ContactUsWidget(
            check: mList[index].check,
            title: mList[index].title,
            details: mList[index].details,
            image: mList[index].image,
          ),
    );
  }
}
