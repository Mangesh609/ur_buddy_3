import 'package:flutter/material.dart';
import 'package:ur_buddy_3/event/screens/organise_event.dart';
import 'package:ur_buddy_3/event/widgets/event_card.dart';
import 'package:ur_buddy_3/event/widgets/option_card_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class EventPageDashboard extends StatefulWidget {
  @override
  _EventPageDashboardState createState() => _EventPageDashboardState();
}

class _EventPageDashboardState extends State<EventPageDashboard> {
  SwiperController _pageViewController = SwiperController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Good morning", style: theme.appBarTheme.titleTextStyle),
                  IconButton(
                    icon: Icon(Icons.notifications,
                        size: 30,
                        color: theme.appBarTheme.titleTextStyle.color),
                    onPressed: null,
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OptionCardWidget(
                    title: "Your Events",
                    color: Color.fromRGBO(255, 111, 97, 1),
                    avatar: Text("2",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  OptionCardWidget(
                    title: "Intrested",
                    color: Color.fromRGBO(112, 199, 248, 1),
                    avatar: Text("2",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  OptionCardWidget(
                    title: "Organise",
                    color: Color.fromRGBO(255, 165, 0, 1),
                    avatar: Icon(Icons.add, size: 40),
                    fun: () => Navigator.of(context)
                        .pushNamed(OrganiseEvent.routeName),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text("Events", style: theme.appBarTheme.titleTextStyle),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 375,
              child: new Swiper(
                autoplay: true,
                controller: _pageViewController,
                onIndexChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                outer: true,
                duration: 200,
                itemBuilder: (BuildContext context, int index) {
                  return EventCard();
                },
                itemCount: 10,
                viewportFraction: 0.6,
                scale: 0.9,
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              "${_index + 1} of 10",
              style: TextStyle(color: Colors.white),
            )),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
