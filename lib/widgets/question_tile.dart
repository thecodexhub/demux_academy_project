import 'package:demux_academy_project/app/question/question_page.dart';
import 'package:demux_academy_project/widgets/header_widget.dart';
import 'package:demux_academy_project/widgets/tag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  QuestionTile({
    Key key,
    @required this.title,
    @required this.difficulty,
    @required this.topics,
    @required this.question,
    @required this.example,
    @required this.frequency,
    @required this.interviewType,
    @required this.placementType,
    @required this.company,
    @required this.college,
  }) : super(key: key);
  final String title;
  final int difficulty;
  final String topics;
  final String question;
  final String example;
  final double frequency;
  final String interviewType;
  final String placementType;
  final List<dynamic> company;
  final List<dynamic> college;

  @override
  Widget build(BuildContext context) {
    List<String> companies = company.whereType<String>().toList();
    List<String> colleges = college.whereType<String>().toList();

    return Padding(
      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        elevation: 2.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) {
                return QuestionPage(
                  question: question,
                  example: example,
                  topics: topics,
                  difficulty: difficulty,
                  companies: companies,
                  colleges: colleges,
                  interviewType: interviewType,
                  placementType: placementType,
                );
              }),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: title,
                  topics: topics,
                  frequency: frequency,
                ),
                SizedBox(height: 8.0),
                TagWidget(
                  difficulty: difficulty,
                  interviewType: interviewType,
                  placementType: placementType,
                  company: companies,
                ),
                SizedBox(height: 6.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
