import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final onChange;
  final condition;

  CustomSlider({this.onChange,this.condition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
            data: SliderThemeData(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey[600],
                trackHeight: 5,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.white,
                thumbColor: Colors.white,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                showValueIndicator: ShowValueIndicator.always),
            child: Row(children: [
              Text(
                "1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(
                child: Slider(
                  value: condition,
                  max: 5,
                  min: 1,
                  divisions: 8,
                  label: "$condition",
                  onChanged: onChange,
                ),
              ),
              Text(
                "5",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ])),
            SizedBox(height: 5,),
            Text("Item conditon   $condition",style: Theme.of(context).textTheme.headline6,),
        
      ],
    );
  }
}