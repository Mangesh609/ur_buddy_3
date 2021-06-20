import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          child: Column(
            children: [
              SizedBox(
                height: 230,width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    placeholder: "images/placeholder.png",
                    image: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1574144362",fit: BoxFit.cover,))),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 15),
                          Expanded(child: Text("Movie Night ❤",maxLines: 2,style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w600))),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text("10:00 A.M",maxLines: 2,style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(37, 36, 44, 1)
          ),
        ),
          Positioned(
            bottom: 0,
            left: 15,
            child: Container(
              height: 55,
              width: 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("24",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.black)),
                  Text("Feb",style: TextStyle(fontSize:17, fontWeight: FontWeight.w800,color:Colors.black))
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Positioned(
          right: 10,
          top: 10,
          child: Container(
            height: 40,
            width: 40,
            child: Icon(Icons.favorite_sharp,color: Colors.grey,size: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
      ],
    );
  }
}