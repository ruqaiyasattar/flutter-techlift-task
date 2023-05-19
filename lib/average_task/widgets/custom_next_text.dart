import 'package:flutter/material.dart';

class CustomNextText extends StatelessWidget {
  final String heading;
  final String desc;

  const CustomNextText({
    super.key,
    required this.heading,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.left,
            heading, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
          const SizedBox(height: 6,),
          SizedBox(
            width: 200,
            child: Text(
              desc,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
