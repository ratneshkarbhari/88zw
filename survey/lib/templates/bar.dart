import 'package:flutter/material.dart';

class Bar extends StatelessWidget with PreferredSizeWidget {
  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Surveys"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.exit_to_app),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
