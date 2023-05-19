import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  final String heading;
  final String desc;

  const CustomSmallText({super.key, required this.heading, required this.desc});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(heading, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
          SizedBox(
            width: 50,
            child: Text(
              desc,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
