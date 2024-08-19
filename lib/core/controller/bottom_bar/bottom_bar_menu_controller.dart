import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/bottom_bar/bottom_navigation_item.dart';
import 'package:shop_app_mobile/views/screen/cart/cart_screen.dart';
import 'package:shop_app_mobile/views/screen/home/home_screen.dart';
import 'package:shop_app_mobile/views/screen/profile/profile_screen.dart';
import 'package:shop_app_mobile/views/screen/saved/saved_screen.dart';
import 'package:shop_app_mobile/views/screen/search/search_screen.dart';

class BottomBarMenuController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  final List<CustomNavigationItem> items = [
    CustomNavigationItem(initialLocation: '/home', icon: Icons.home_outlined),
    CustomNavigationItem(initialLocation: '/search', icon: Icons.search),
    CustomNavigationItem(initialLocation: '/saved', icon: Icons.favorite_border_outlined),
    CustomNavigationItem(initialLocation: '/cart', icon: Icons.shopping_cart_outlined),
    CustomNavigationItem(initialLocation: '/profile', icon: Icons.person_outline),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
