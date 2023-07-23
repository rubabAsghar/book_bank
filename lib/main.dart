import 'package:book_bank/components/constant/constant.dart';
import 'package:book_bank/generated/assets.dart';
import 'package:book_bank/screens/chatscreen/ChatScreen.dart';
import 'package:book_bank/screens/chatscreen/MessageListScreen.dart';
import 'package:book_bank/screens/homescreen/CheckoutScreen.dart';
import 'package:book_bank/screens/homescreen/DonationScreenSteps.dart';
import 'package:book_bank/screens/homescreen/ForgotPasswordScreen.dart';
import 'package:book_bank/screens/homescreen/ProductListing.dart';
import 'package:book_bank/screens/homescreen/ProductPage2.dart';
import 'package:book_bank/screens/homescreen/ProductScreen.dart';
import 'package:book_bank/screens/homescreen/WishlistScreen.dart';
import 'package:book_bank/screens/homescreen/favouritelist.dart';
import 'package:book_bank/screens/homescreen/homescreen2.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/Contactus.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/Customers.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/DonateNowScreen.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/PurchaseHistoryScreen.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/dashboard.dart';
import 'package:book_bank/view/get_start_screen/get_start_screen.dart';
import 'package:book_bank/view/login_screen/login_screen.dart';
import 'package:book_bank/view/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:book_bank/screens/homescreen/cart.dart';
import 'package:book_bank/screens/homescreen/homescreendrawer/drawerSettings.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  name: "Book Bank",
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
//ab test kar k bto ok wait
      theme: ThemeData(
        primaryColor: appThemeColor,
        primaryColorDark: appThemeColor,
        primarySwatch: createMaterialColor(const Color(0xff6C63FF)),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        primaryTextTheme:
        GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),


      home: SplashScreen(),// old code
      //new code
      // initialRoute: homescreen2.id,
      //
      routes: {
         homescreen2.id: (context)=> homescreen2(),
         cart.id: (context)=>  cart(),
         ProductListing.id: (context)=>  ProductListing(),
         ProductPage2.id: (context)=>  ProductPage2(),
        DonationScreenSteps.id: (context)=>  DonationScreenSteps(),
         favouritelist.id: (context)=>  favouritelist(),
          WishlistScreen.id: (context)=>  WishlistScreen(),
          CheckoutScreen.id: (context)=>  CheckoutScreen(),




        MessageListScreen.id: (context) => MessageListScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        SearchScreen.id: (context) => SearchScreen(),

        SettingsScreen.id: (context) => SettingsScreen(),
        MessageRequestsScreen.id: (context) => MessageRequestsScreen(),
        ArchivedChatsScreen.id: (context) => ArchivedChatsScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),

        LoginScreen.id: (context) => LoginScreen(),
        //SettingsScreen
        drawerSettings.id: (context) => drawerSettings(),
        //dashboard
        dashboard.id: (context) => dashboard(),
        CustomerDetailsScreen.id: (context) => CustomerDetailsScreen(customerName: '', orderCount: 0, amount: 0,customerLocation: '',),

        //ProductScreen
        //PurchaseHistoryScreen
        Customers.id: (context) => Customers(),
        ProductScreen.id: (context) => ProductScreen(),
        PurchaseHistoryScreen.id: (context) => PurchaseHistoryScreen(),
        // ContactUsScreen
        ContactUsScreen.id: (context) => ContactUsScreen(),
        //DonateNowScreen
        DonateNowScreen.id: (context) => DonateNowScreen(),





      },




    );
  }
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
