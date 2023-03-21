import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          body,
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16.0),
              ),
            ),
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    "R",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
