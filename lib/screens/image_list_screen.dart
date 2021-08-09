import 'package:devsteam_test_task/screens/image_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:devsteam_test_task/models/image_list_model.dart';
import 'dart:convert';
import 'package:devsteam_test_task/assets/consts.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  Future<List<ImageCard>> fetchImage() async {
    imageList = [];
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      print(response.body);
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            imageList.add(ImageCard.fromJson(map));
          }
        }
        setState(() {});
      }
      return imageList;
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  void initState() {
    super.initState();

    fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'UNSPLASH',
          style: kMainTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageInfoScreen(
                            fullImageUrl: imageList[index].urls!.full!,
                            name: imageList[index].user!.name!,
                            description: imageList[index].description!,
                          ),
                        ),
                      ),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          image: DecorationImage(
                            image:
                                NetworkImage(imageList[index].urls!.regular!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            imageList[index].user!.name!,
                            style: kMainTextStyle,
                          ),
                          imageList[index].description != null
                              ? Text(
                                  imageList[index].description!,
                                  style: kDescriptionStyle,
                                )
                              : Text(
                                  imageList[index].description =
                                      'no description',
                                  style: kDescriptionStyle,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
