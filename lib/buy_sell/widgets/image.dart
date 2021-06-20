import 'package:flutter/material.dart';

class ClassifiedImage extends StatelessWidget {
  final url;
  ClassifiedImage({this.url});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: url == null ? 
      Image.asset(
        "images/placeholder.png",
        height: 250,
        width: 500,
        fit: BoxFit.cover,
        )
      : Image.network(
        'https://api.time.com/wp-content/uploads/2019/11/top-10-fiction-2019.jpg',
        height: 250,
        width: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}
