import 'package:flutter/material.dart';

class OptionCardWidget extends StatelessWidget {
  final avatar;
  final color;
  final title;
  final fun;
  OptionCardWidget({this.avatar, this.color, this.title, this.fun});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        height: 170,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                child: Center(child: avatar),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Text(title,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
