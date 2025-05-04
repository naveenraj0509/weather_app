import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  final IconData gridicon;
  final String title;
  final String? text;
  final AssetImage image;
  final String? text2;

  const GridViewWidget(
      {super.key,
      required this.title,
      this.text,
      required this.image,
      this.text2,
      required this.gridicon});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.gridicon,
                  color: Colors.white,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Text(
            widget.text ?? "",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Image(
            image: widget.image,
            width: 80,
            height: 80,
          ),
          Text(
            widget.text2 ?? "",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );

  }
}
