import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.extent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 15,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
            padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(6, (index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[600],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.black38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        color: Colors.grey[500],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 20,
                        width: 100,
                        margin: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[500]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 20,
                        width: 140,
                        margin: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green[500]),
                      )
                    ],
                  ),
              ),
            ),
          );
            }),
          ),
      ),
    );
  }
}
