import 'package:flutter/material.dart';

class EditJobPostScreen extends StatelessWidget {
  const EditJobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Job Post')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [Text('Edit Job Post')]),
        ),
      ),
    );
  }
}
