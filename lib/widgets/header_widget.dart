import 'package:demux_academy_project/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key key,
    @required this.title,
    @required this.topics,
    @required this.frequency,
  }) : super(key: key);
  final String title;
  final String topics;
  final double frequency;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text('frequency'),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                topics,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 4.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[300],
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 4.0,
                width: frequency * 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: darkYellowColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
