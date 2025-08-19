import 'package:flutter/material.dart';

class BottomBarItemModel {
  final String name;
  final IconData icon;
  final IconData activeIcon;

  const BottomBarItemModel({
    required this.name,
    required this.icon,
    required this.activeIcon,
  });
}
