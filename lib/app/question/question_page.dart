import 'package:demux_academy_project/constants.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({
    Key key,
    @required this.question,
    @required this.example,
    @required this.topics,
    @required this.difficulty,
    @required this.companies,
    @required this.colleges,
    @required this.interviewType,
    @required this.placementType,
  }) : super(key: key);
  final String question;
  final String example;
  final String topics;
  final int difficulty;
  final List<String> companies;
  final List<String> colleges;
  final String interviewType;
  final String placementType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(topics),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Question-',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      getDifficultyFromInt(difficulty),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: getDifficultyColorFromInt(difficulty),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                Text(
                  question.replaceAll('\\n ', '\n'),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  'Example-',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.0),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: whiteColor,
                  ),
                  child: Text(
                    example.replaceAll('\\n ', '\n'),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                _buildCompanies(),
                SizedBox(height: 12.0),
                _buildColleges(),
                SizedBox(height: 12.0),
                Text.rich(
                  TextSpan(
                    text: 'Type of interview: ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: interviewType.capitalize() + ' exam',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                Text.rich(
                  TextSpan(
                    text: 'Job type: ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: placementType.capitalize(),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColleges() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Colleges asked at: ',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6.0),
        Wrap(
          direction: Axis.horizontal,
          children: colleges.map(
            (company) {
              return Container(
                width: 120.0,
                margin: EdgeInsets.only(right: 6.0),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    company,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Companies asking this: ',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6.0),
        Wrap(
          direction: Axis.horizontal,
          children: companies.map(
            (company) {
              return Container(
                width: 100.0,
                margin: EdgeInsets.only(right: 6.0),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    company,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: whiteColor,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
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
