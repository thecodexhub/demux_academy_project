import 'package:demux_academy_project/constants.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  TagWidget({
    Key key,
    @required this.difficulty,
    @required this.interviewType,
    @required this.placementType,
    @required this.company,
  }) : super(key: key);
  final int difficulty;
  final String interviewType;
  final String placementType;
  final List<String> company;

  Widget _buildTagContainer({
    String text,
    Color color,
    Color textColor,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 100.0),
      padding: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      
      spacing: 6.0,
      runSpacing: 6.0,
      children: [
        _buildTagContainer(
          text: getDifficultyFromInt(difficulty),
          color: getDifficultyColorFromInt(difficulty),
          textColor: Colors.white,
        ),
        _buildTagContainer(
          text: placementType.capitalize(),
          color: Colors.yellow[300],
          textColor: primaryColor,
        ),
        _buildTagContainer(
          text: interviewType.capitalize(),
          color: Colors.white,
          textColor: Colors.black87,
        ),
      ],
    );
  }

  Color getDifficultyColorFromInt(int difficulty) {
    Color difficltyStringColor;
    switch (difficulty) {
      case 0:
        difficltyStringColor = Colors.green;
        break;
      case 1:
        difficltyStringColor = Colors.deepOrange;
        break;
      case 2:
        difficltyStringColor = Colors.red;
        break;
    }
    return difficltyStringColor;
  }

  String getDifficultyFromInt(int difficulty) {
    String difficltyString = '';
    switch (difficulty) {
      case 0:
        difficltyString = 'Easy';
        break;
      case 1:
        difficltyString = 'Medium';
        break;
      case 2:
        difficltyString = 'Hard';
        break;
    }
    return difficltyString;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
