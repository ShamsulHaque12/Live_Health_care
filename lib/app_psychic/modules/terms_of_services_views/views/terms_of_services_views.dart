import 'package:flutter/material.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';

class TermsOfServicesViews extends StatelessWidget {
  const TermsOfServicesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Terms of Services",
      ),
    );
  }
}