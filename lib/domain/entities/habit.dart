import 'package:flutter/material.dart';

class Habit {
  final String id;
  final String name;
  final String icon;
  final Color color;
  final Color bgColor;
  final int sortOrder;
  final DateTime createdAt;

  Habit({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.sortOrder,
    required this.createdAt,
  });
}
