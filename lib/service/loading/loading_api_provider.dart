import 'dart:async';
import 'dart:typed_data';

import 'package:Cake_Clicker/main.dart';
import 'package:Cake_Clicker/models/userdata.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import '../../models/cake.dart';

class LoadingProvider {
  Future<UserData> getUserData() async {
    return UserData(
        name: 'User',
        background: 'assets/backgrounds/allbackgroundstars.png',
        cakes: getCakesList(),
        money: 0);
  }
}

List<Cake> getCakesList() {
  return [
    Cake(image: 'assets/cakes/apple_pie_64.png', clickCount: 10, priceCount: 1),
    Cake(
        image: 'assets/cakes/bananasplit_64.png', clickCount: 6, priceCount: 1),
    Cake(
        image: 'assets/cakes/cherry_cake_64.png', clickCount: 6, priceCount: 1),
    Cake(
        image: 'assets/cakes/cherry_cakeslice_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/cherry_confit_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/cherry_macaroon_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/chocolate_cookie_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/chocolate_icecream_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/chocolate_macaroon_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/chocolate_truffle_64.png',
        clickCount: 10,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_cake_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_cakeslice_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_cookie_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_cupcake_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_icecream_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/funfetti_macaroon_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/japanese_pudding_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/lemon_cookie_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/lemon_macaroon_64.png',
        clickCount: 10,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/lemon_sorbet_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(image: 'assets/cakes/lemon_tart_64.png', clickCount: 6, priceCount: 1),
    Cake(
        image: 'assets/cakes/lemon_tartslice_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/raspberry_chocolate_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/raspberry_cupcake_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/raspberry_fruit_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_cakeslice_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_cake_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_chocolate_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_cupcake_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_fruit_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_icecream_64.png',
        clickCount: 6,
        priceCount: 1),
    Cake(
        image: 'assets/cakes/strawberry_macaroon_64.png',
        clickCount: 6,
        priceCount: 1),
  ];
}
//
