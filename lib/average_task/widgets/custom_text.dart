import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String heading;
  final String desc;

  const CustomText({super.key, required this.heading, required this.desc});

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(heading, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
          SizedBox(
            width: 200,
            child: Text(
              desc,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              maxLines: 10,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
