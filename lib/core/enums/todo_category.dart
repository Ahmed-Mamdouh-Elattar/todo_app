import 'package:flutter/material.dart';

enum TodoCategory {
  work(color: Colors.blue, icon: Icons.work),
  personal(color: Colors.green, icon: Icons.person),
  home(color: Colors.orange, icon: Icons.home),
  shopping(color: Colors.purple, icon: Icons.shopping_cart),
  health(color: Colors.red, icon: Icons.local_hospital),
  finance(color: Colors.teal, icon: Icons.account_balance_wallet),
  education(color: Colors.indigo, icon: Icons.school),
  travel(color: Colors.pink, icon: Icons.flight_takeoff),
  social(color: Colors.cyan, icon: Icons.people),
  others(color: Colors.grey, icon: Icons.calendar_month);

  final Color color;
  final IconData icon;
  const TodoCategory({required this.color, required this.icon});
}
