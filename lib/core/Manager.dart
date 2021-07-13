//import 'dart:io';
//
//import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:minbaladeh_world/UI/HomeTapBar/home/bloc/home_bloc.dart';
//import 'package:minbaladeh_world/UI/HomeTapBar/home/bloc/home_event.dart';
//import 'package:minbaladeh_world/UI/orders_history/screen/order_history_details/order_history_details_screen.dart';
//import 'package:minbaladeh_world/Utils/constants.dart';
//import 'package:minbaladeh_world/Utils/file_path/file_path.dart';
//import 'package:minbaladeh_world/injection.dart';
//
//class Manager {
//  static void toastMessage(String message, Color color) {
//    Fluttertoast.showToast(
//        msg: message,
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 2,
//        textColor: Colors.white,
//        backgroundColor: color,
//        fontSize: 16.0);
//  }
//
//  static void toastMessageProductOutOfQuantity(String message, Color color) {
//    Fluttertoast.showToast(
//        msg: message,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 2,
//        textColor: Colors.white,
//        backgroundColor: color,
//        fontSize: 16.0);
//  }
//
//  static Future<void> CheckInternet() async {
//    try {
//      final result = await InternetAddress.lookup('example.com');
//      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        print('connected');
//      } else {}
//    } on SocketException catch (e) {}
//  }
//
//  static void ViewSuccessDialog(BuildContext context, int orderid) {
//    AwesomeDialog(
//      btnOkColor: green,
//      context: context,
//      animType: AnimType.SCALE,
//      dialogType: DialogType.SUCCES,
//
//      onDissmissCallback: (type) {
//        Navigator.popUntil(context, (route) => route.isFirst);
//
//        locator<HomeBloc>().add(ViewLatestOrderDetails(orderid));
//      },
//      title: 'Order Placed',
//      desc: 'if you are registerd your can track your order',
//      btnOkOnPress: () {},
//    )..show();
//  }
//
//  static void ViewGoToOrderDetailsDialog(BuildContext context, int orderid) {
//    AwesomeDialog(
//        btnOkColor: green,
//        btnCancelColor: red,
//        context: context,
//        animType: AnimType.SCALE,
//        dialogType: DialogType.NO_HEADER,
//        title: 'New Order!',
//        desc:
//            'Thank you for placing an order, Would you like to view latest order details ?!',
//        btnOkOnPress: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => OrderDetailsScreen(
//                        orderId: orderid,
//                      )));
//        },
//        btnCancelOnPress: () {})
//      ..show();
//  }
//
//  static void SuccessDialog(BuildContext context, String message) {
//    AwesomeDialog(
//      context: context,
//      animType: AnimType.SCALE,
//      dialogType: DialogType.SUCCES,
//      btnOkColor: green,
//      onDissmissCallback: (type) {
////        Navigator.popUntil(context, (route) => route.isFirst);
//      },
//      body: Center(
//        child: Text(
//          '$message',
//          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//        ),
//      ),
//      btnOkOnPress: () {},
//    )..show();
//  }
//
//  static void viewFailedDialog(BuildContext context, String message) {
//    AwesomeDialog(
//      context: context,
//      animType: AnimType.SCALE,
//      dialogType: DialogType.INFO,
//      onDissmissCallback: (type) {
//        Navigator.popUntil(context, (route) => route.isFirst);
//      },
//      title: "Checkout",
//      desc: message,
//    )..show();
//  }
//
//  static void viewWelcomeMessage(BuildContext context) {
//    AwesomeDialog(
//      context: context,
//      animType: AnimType.SCALE,
//      dialogType: DialogType.NO_HEADER,
//      body: Column(
//        children: [
//          Image(
//              height: 100, width: 100, image: AssetImage(FilePath.LOGO_FLOWER)),
//          Text(
//            'Ahla w sahla',
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          Text(
//            'Thank you for joining Minbaladeh',
//            style: TextStyle(fontSize: 15),
//          ),
//        ],
//      ),
//    )..show();
//  }
//}
