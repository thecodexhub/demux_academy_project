import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demux_academy_project/constants.dart';
import 'package:demux_academy_project/services/database.dart';
import 'package:demux_academy_project/widgets/question_tile.dart';
import 'package:demux_academy_project/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Stream questionsStream;
  DatabaseService databaseService = DatabaseService();

  Color buttonColor = Colors.grey[50];
  Color buttonBorderColor = Colors.grey[400];
  IconData buttonIcon = Icons.arrow_drop_down;

  bool _showOverlayContainer = false;

  @override
  void initState() {
    super.initState();
    databaseService.getQuestions().then((value) {
      setState(() {
        questionsStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Placement QNA'),
          centerTitle: true,
          elevation: 2.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: Container(
              width: double.infinity,
              height: 45.0,
              color: Colors.grey[50],
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Row(
                children: [
                  _buildFilterOptions(),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: StreamBuilder(
                stream: questionsStream,
                builder: (context, snapshot) {
                  return snapshot.data == null
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data.documents.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return SizedBox(height: 12.0);
                            }
                            return QuestionTile(
                              title: snapshot.data.documents[index - 1]
                                  ['title'],
                              topics: snapshot.data.documents[index - 1]
                                  ['topics'],
                              difficulty: snapshot.data.documents[index - 1]
                                  ['difficulty'],
                              question: snapshot.data.documents[index - 1]
                                  ['question'],
                              example: snapshot.data.documents[index - 1]
                                  ['example'],
                              frequency: snapshot.data.documents[index - 1]
                                  ['frequency'],
                              interviewType: snapshot.data.documents[index - 1]
                                  ['interview_type'],
                              placementType: snapshot.data.documents[index - 1]
                                  ['placement_type'],
                              company: snapshot.data.documents[index - 1]
                                  ['company'],
                              college: snapshot.data.documents[index - 1]
                                  ['college'],
                            );
                          },
                        );
                },
              ),
            ),
            _showOverlayContainer
                ? Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 100.0),
                      color: Colors.grey[50],
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Filter(
                        onClearButtonPressed: () {
                          databaseService.getQuestions().then((value) {
                            setState(() {
                              questionsStream = value;
                              buttonIcon = Icons.arrow_drop_down;
                              buttonColor = Colors.grey[50];
                              buttonBorderColor = Colors.grey[400];
                              _showOverlayContainer = false;
                            });
                          });
                        },
                        onTopicsFilterDone: (value) {
                          setState(() {
                            buttonIcon = Icons.arrow_drop_down;
                            _showOverlayContainer = false;
                          });
                          if (value != null) {
                            databaseService
                                .getQuestionsByFilter(
                                    key: 'topics', value: value)
                                .then((value) {
                              questionsStream = value;
                            });
                          }
                        },
                        onCompaniesFilterDone: (value) {
                          setState(() {
                            buttonIcon = Icons.arrow_drop_down;
                            _showOverlayContainer = false;
                          });
                          if (value != null) {
                            databaseService
                                .getQuestionsByFilterArray(
                                    key: 'company', arrayValue: value)
                                .then((value) {
                              questionsStream = value;
                            });
                          }
                        },
                        onInterviewTypeFilterDone: (value) {
                          setState(() {
                            buttonIcon = Icons.arrow_drop_down;
                            _showOverlayContainer = false;
                          });
                          if (value != null) {
                            databaseService
                                .getQuestionsByFilter(
                                    key: 'interview_type', value: value)
                                .then((value) {
                              questionsStream = value;
                            });
                          }
                        },
                        onPlacementTypeFilterDone: (value) {
                          setState(() {
                            buttonIcon = Icons.arrow_drop_down;
                            _showOverlayContainer = false;
                          });
                          if (value != null) {
                            databaseService
                                .getQuestionsByFilter(
                                    key: 'placement_type', value: value)
                                .then((value) {
                              questionsStream = value;
                            });
                          }
                        },
                        onCollegesFilterDone: (value) {
                          setState(() {
                            buttonIcon = Icons.arrow_drop_down;
                            _showOverlayContainer = false;
                          });
                          if (value != null) {
                            databaseService
                                .getQuestionsByFilterArray(
                                    key: 'college', arrayValue: value)
                                .then((value) {
                              questionsStream = value;
                            });
                          }
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOptions() {
    return InkWell(
      onTap: () {
        setState(() {
          _showOverlayContainer = !_showOverlayContainer;
          buttonIcon = _showOverlayContainer
              ? Icons.arrow_drop_up
              : Icons.arrow_drop_down;
          buttonColor =
              _showOverlayContainer ? Colors.deepOrange[50] : Colors.grey[50];
          buttonBorderColor =
              _showOverlayContainer ? Colors.deepOrange[400] : Colors.grey[400];
        });
      },
      child: Container(
        height: 36,
        // width: 100.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: buttonColor,
          border: Border.all(
            color: buttonBorderColor,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Filter'),
            Icon(buttonIcon),
          ],
        ),
      ),
    );
  }
}
