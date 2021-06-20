import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/buy_sell/widgets/custom_slider.dart';

import 'package:ur_buddy_3/buy_sell/widgets/price_condition_row.dart';
import 'package:ur_buddy_3/buy_sell/widgets/title_image_row.dart';
import 'package:ur_buddy_3/common_widgets/custom_alert_dialogue.dart';
import 'package:ur_buddy_3/common_widgets/custom_flatButton.dart';
import 'package:ur_buddy_3/common_widgets/custom_textField.dart';
import 'package:ur_buddy_3/services/service_locator.dart';
import 'package:ur_buddy_3/services/classifieds_service.dart';
import 'package:ur_buddy_3/models/classified.dart';

class SellPageBody extends StatefulWidget {
  const SellPageBody({
    Key key,
  }) : super(key: key);
  @override
  _SellPageBodyState createState() => _SellPageBodyState();
}

class _SellPageBodyState extends State<SellPageBody> {
  var _title = '';
  var _subTitle = '';
  var _description = '';
  var _price = '';
  var _condition = 1.0;

  bool _isLoading = false;

  ClassifiedsService _classifiedsService = getIt<ClassifiedsService>();
  Future<void> _submitClassified(ctx) async {
    if (_title.isEmpty ||
        _subTitle.isEmpty ||
        _description.isEmpty ||
        _price.isEmpty) {
      return showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialogue();
          });
    }
    print("$_title, $_subTitle, $_description, $_price, $_condition");
    await Provider.of<ClassifiedsProvider>(
      context,
      listen: false,
    ).addClassified(
      _title, _subTitle, _description, _price, _condition.toString(), DateTime.now(),
          context
    );
  }

  //Pre advertisement processing
  _postingProcess(ctx) async {
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();
    //check current add pool
    int adPool = await _classifiedsService.isAdAvailable();
    if (adPool == 0) {
      if (await _classifiedsService.mineAd()) {
        //post ad
        _classifiedsService.decrementAdPool();
        _submitClassified(ctx);
      } else {
        //No ads available
        //TODO: Add popup for this
        print("No ad quota available");
      }
    } else {
      //post ad
      _classifiedsService.decrementAdPool();
      _submitClassified(ctx);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 15, 13, 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            TitleImageRow(
              onChangedTitle: (value) {
                _title = value;
              },
              onChangedSubTitle: (value) {
                _subTitle = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: CustomTextField(
                label: 'Description',
                maxlines: 10,
                onChanged: (value) {
                  _description = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PriceConditionRow(
              onChangedPrice: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomSlider(
              condition: _condition,
              onChange: (value) {
                setState(() {
                  _condition = value;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomFlatButton(
                      label: 'Put On Sale',
                      onPressed: () => _postingProcess(context),
                    ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
