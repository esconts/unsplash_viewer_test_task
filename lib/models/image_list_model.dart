import 'package:flutter/material.dart';

class ImageCard {
  ImageCard({
    this.description,
    this.urls,
    this.user,
  });

  String? description;
  Urls? urls;
  User? user;

  factory ImageCard.fromJson(Map<String, dynamic> json) {
    return ImageCard(
      description: json['description'],
      urls: json['urls'] != null ? new Urls.fromJson(json['urls']) : null,
      user: json['user'] != null ? new User.fromJson(json['user']) : null,
    );
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class User {
  String? name;

  User({
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    return data;
  }
}

List<ImageCard> imageList = [];
