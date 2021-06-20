import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ur_buddy_3/buy_sell/widgets/loader.dart';
import 'package:ur_buddy_3/models/user.dart';
import './buy_sell/screens/classified_detail_screen.dart';

import './models/classified.dart';
import './profile/screens/edit_profile_screen.dart';
import './buy_sell/screens/sell_item_page.dart';
import './buy_sell/screens/buy_item_page.dart';
import './event/screens/organise_event.dart';
import './homepage/screens/home_screen.dart';
import './splash_screen.dart';
import './auth/screens/login_screen.dart';
import './auth/screens/signup_screen.dart';
import './profile/screens/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ur_buddy_3/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryBlack = Color.fromRGBO(18, 18, 18, 1);
  final Color accentWhite = Color.fromRGBO(253, 244, 244, 1);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClassifiedsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'UrBuddy 3.0',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: primaryBlack,
          scaffoldBackgroundColor: primaryBlack,
          accentColor: accentWhite,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backwardsCompatibility: false,
            iconTheme: IconThemeData(color: accentWhite, size: 24),
            titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              color: accentWhite,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            color: primaryBlack,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: primaryBlack,
            ),
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: accentWhite,
            ),
            headline4: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: accentWhite,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: accentWhite,
            ),
          ),
        ),
        home: SplashScreen(),
        routes: {
          SignUpScreen.routeName: (context) => SignUpScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          OrganiseEvent.routeName: (context) => OrganiseEvent(),
          SellItemPage.routeName: (context) => SellItemPage(),
          EditProfile.routeName: (context) => EditProfile(),
          ClassifiedDetailScreen.routeName: (context) => ClassifiedDetailScreen()
        },
      ),
    );
  }
}
