import 'package:flutter/material.dart';

import '../../../../core/global_widgets/custom_app_bar.dart';

class PrivacyPolicyViews extends StatelessWidget {
  const PrivacyPolicyViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Privacy Policy"),
    );
  }
}