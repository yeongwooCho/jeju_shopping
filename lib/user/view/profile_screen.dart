import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class ProfileScreen extends StatelessWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: const Placeholder(),
    );
  }
}
