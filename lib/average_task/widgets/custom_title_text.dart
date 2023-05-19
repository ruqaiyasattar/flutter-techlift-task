import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String title;

  const CustomTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: title.toString(),
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
            children: const [
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0), // Adjust the spacing as needed
                  child: SizedBox(
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        )


      ],
    );
  }
}
