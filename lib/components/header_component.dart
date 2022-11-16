import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/widget/display_name.dart';
import 'package:flutter_application_b1909960/widget/display_profile_picture.dart';
import 'package:flutter_application_b1909960/widget/display_status.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayName(),
            const SizedBox(height: 5),
            const DisplayStatus(),
          ],
        ),
        DisPlayProfilePicture()
      ],
    );
  }
}
