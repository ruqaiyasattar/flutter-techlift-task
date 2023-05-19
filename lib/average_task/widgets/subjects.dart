import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Subjects extends HookWidget {

  final ValueNotifier<String> controller;
  final String? label;

  const Subjects({
    this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: InputDecorator(
              decoration: InputDecoration(
                prefixText: label,
                border: InputBorder.none,
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Marks',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
