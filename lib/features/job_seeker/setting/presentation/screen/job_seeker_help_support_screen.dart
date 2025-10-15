import 'package:flutter/material.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/constants/app_string.dart';

class JobSeekerHelpSupportScreen extends StatelessWidget {
  const JobSeekerHelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.helpAndSupport,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: _bodySection(),
    );
  }

  /// Body Section starts here
  Widget _bodySection() {
    return const SingleChildScrollView(
      child: Column(children: [Text('Help and Support')]),
    );
  }
}
