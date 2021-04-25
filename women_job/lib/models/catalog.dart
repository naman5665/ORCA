import 'package:flutter/material.dart';

class CatalogModel {
  static List<Item> items = [
    Item(
      title: "Online Educator",
      company: "Varsity Tutors",
      location: "Remote"
    )
  ];

}

class Item {

  final String title;
  final String company;
  final String location;


  Item({this.title,this.company,this.location});

  factory Item.fromMap(Map<String , dynamic> map){
    return  Item(
        title: map["title"],
        company: map["company"],
        location: map["location"],
    );
  }

  toMap() => {
    "title": title,
    "company": company,
    "location": location,
  };

}