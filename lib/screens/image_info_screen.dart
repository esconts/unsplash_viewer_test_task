import 'package:flutter/material.dart';
import 'package:devsteam_test_task/assets/consts.dart';

class ImageInfoScreen extends StatefulWidget {
  ImageInfoScreen({
    @required this.fullImageUrl,
    @required this.name,
    @required this.description,
  });

  String? fullImageUrl;
  String? name;
  String? description;

  @override
  _ImageInfoScreenState createState() => _ImageInfoScreenState();
}

class _ImageInfoScreenState extends State<ImageInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
        title: Column(
          children: [
            Text(
              widget.name!,
              style: kMainTextStyle,
            ),
            Text(
              widget.description!,
              style: kDescriptionStyle,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(child: Image.network(widget.fullImageUrl!)),
        // child: Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 300,
        //   margin: EdgeInsets.all(12),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
        //     image: DecorationImage(
        //       image: NetworkImage(widget.fullImageUrl!),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
