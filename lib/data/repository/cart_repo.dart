import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';
import '../../utils/app_constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  // Shared Preference save data as a String
  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];

    // convert objects to String because sharedpreference only accept String

    /*
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    */

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    List<CartModel> cartList = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList :  " + carts.toString());
    }

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    /**
        carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));
     */

    return cartList;
  }
}

