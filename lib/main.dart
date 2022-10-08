import 'package:ecom_user_android/pages/cart_page.dart';
import 'package:ecom_user_android/pages/checkout_page.dart';
import 'package:ecom_user_android/pages/launcher_page.dart';
import 'package:ecom_user_android/pages/login_page.dart';
import 'package:ecom_user_android/pages/order_details_page.dart';
import 'package:ecom_user_android/pages/order_successful_page.dart';
import 'package:ecom_user_android/pages/product_details_page.dart';
import 'package:ecom_user_android/pages/product_list_page.dart';
import 'package:ecom_user_android/pages/user_order_list_page.dart';
import 'package:ecom_user_android/pages/user_profile_page.dart';
import 'package:ecom_user_android/providers/cart_provider.dart';
import 'package:ecom_user_android/providers/order_provider.dart';
import 'package:ecom_user_android/providers/product_provider.dart';
import 'package:ecom_user_android/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LauncherPage(),
      routes: {
        LauncherPage.routeName : (context) => LauncherPage(),
        LoginPage.routeName : (context) => LoginPage(),
        ProductListPage.routeName : (context) => ProductListPage(),
        ProductDetailsPage.routeName : (context) => ProductDetailsPage(),
        UserProfilePage.routeName : (context) => UserProfilePage(),
        CartPage.routeName : (context) => CartPage(),
        CheckoutPage.routeName : (context) => CheckoutPage(),
        OrderSuccessfulPage.routeName : (context) => OrderSuccessfulPage(),
        UserOrderListPage.routeName : (context) => UserOrderListPage(),
        OrderDetailsPage.routeName : (context) => OrderDetailsPage(),
      },
    );
  }
}