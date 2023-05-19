import 'package:flutter/material.dart';
import 'package:techlift_flutter/average_task/widgets/custom_next_text.dart';
import 'package:techlift_flutter/average_task/widgets/custom_small_text.dart';
import 'package:techlift_flutter/average_task/widgets/custom_text.dart';
import 'package:techlift_flutter/average_task/widgets/custom_title_text.dart';

class Resume extends StatelessWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            color: Colors.white70,
            child: Row(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54,
                              width: 1.0,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 39,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/550x/b1/3c/a3/b13ca305487326d44135fe713b30e865.jpg'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Padding(
                          padding: EdgeInsets.only(top: 28.0, left: 6),
                          child: CustomTitleText(title: 'Ruqaiya Sattar',),
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 2.0),
                              child: CustomSmallText(heading: 'Nationality: ', desc: 'Pakistan'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: CustomSmallText(heading: 'DOB: ', desc: '27/06/1994'),
                            ),
                          ],
                        ),
                        const CustomText(
                          heading: 'GitHub: ',
                          desc: 'https://github.com/ruqaiyasattar',
                        ),
                        const CustomText(
                          heading: 'Twitter: ',
                          desc: 'https://twitter.com/ruqaiyasattar',
                        ),
                        const CustomNextText(
                          heading: 'About Me: ',
                          desc: 'I am an enthusiastic, self-motivated, reliable, responsible and hard working person. I am a mature team worker and adaptable to all challenging situations. I am able to work well both in a team environment as well as using own initiative. I am able to work well under pressure and adhere to strict deadlines.',
                        ),
                      ],
                    ),
                  ],

                ),
              ],
            ),
          ),
          /*Container(
            color: Colors.white60,
            child: Column(
              children: const [
                CustomText(
                  heading: 'Twitter:',
                  desc: 'https://twitter.com/ruqaiyasattar',
                ),
              ],
            ),
          ),*/
        ],
      );
  }
}
