import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demux_academy_project/constants.dart';
import 'package:demux_academy_project/widgets/filter.dart';
import 'package:demux_academy_project/widgets/question_tile.dart';
import 'package:flutter/material.dart';

class PaginationHomePage extends StatefulWidget {
  @override
  _PaginationHomePageState createState() => _PaginationHomePageState();
}

class _PaginationHomePageState extends State<PaginationHomePage> {
  Color buttonColor = Colors.grey[50];
  Color buttonBorderColor = Colors.grey[400];
  IconData buttonIcon = Icons.arrow_drop_down;

  bool _showOverlayContainer = false;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _questions = [];
  bool _loadingQuestions = true;
  bool _gettingMoreQuestions = false;
  bool _moreQuestionsAvailable = true;
  DocumentSnapshot _lastDocument;

  int _questionsPerPage = 8;

  ScrollController _scrollController = ScrollController();

  _getQuestions() async {
    setState(() {
      _loadingQuestions = true;
    });
    Query q = _firestore
        .collection('Questions')
        .orderBy('title')
        .limit(_questionsPerPage);
    QuerySnapshot querySnapshot = await q.get();
    _questions = querySnapshot.docs;
    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    setState(() {
      _loadingQuestions = false;
    });
  }

  _getMoreQuestions() async {
    print('More questions added');

    if (_moreQuestionsAvailable == false) {
      // Display message to the user that no more questions
      print('No more questions!');
      return;
    }

    if (_gettingMoreQuestions == true) {
      return;
    }

    _gettingMoreQuestions = true;

    Query q = _firestore
        .collection('Questions')
        .orderBy('title')
        .startAfter([_lastDocument.data()['title']]).limit(_questionsPerPage);

    QuerySnapshot querySnapshot = await q.get();

    if (querySnapshot.docs.length < _questionsPerPage) {
      _moreQuestionsAvailable = false;
    }

    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];

    _questions.addAll(querySnapshot.docs);

    setState(() {});
    _gettingMoreQuestions = false;
  }

  @override
  void initState() {
    super.initState();
    _getQuestions();

    _scrollController.addListener(() {
      double maxExtent = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      if (maxExtent - currentScroll <= delta) {
        _getMoreQuestions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _loadingQuestions == true
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  child: _questions.length == 0
                      ? Center(
                          child: Text('No questions to show'),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: _questions.length,
                          itemBuilder: (context, index) {
                            return QuestionTile(
                              title: _questions[index].data()['title'],
                              difficulty:
                                  _questions[index].data()['difficulty'],
                              topics: _questions[index].data()['topics'],
                              question: _questions[index].data()['question'],
                              example: _questions[index].data()['example'],
                              frequency: _questions[index].data()['frequency'],
                              interviewType:
                                  _questions[index].data()['interview_type'],
                              placementType:
                                  _questions[index].data()['placement_type'],
                              company: _questions[index].data()['company'],
                              college: _questions[index].data()['college'],
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
                        setState(() {
                          _getQuestions();
                          buttonIcon = Icons.arrow_drop_down;
                          buttonColor = Colors.grey[50];
                          buttonBorderColor = Colors.grey[400];
                          _showOverlayContainer = false;
                        });
                      },
                      onTopicsFilterDone: (value) {
                        setState(() {
                          buttonIcon = Icons.arrow_drop_down;
                          _showOverlayContainer = false;
                        });
                        if (value != null) {}
                      },
                      onCompaniesFilterDone: (value) {
                        setState(() {
                          buttonIcon = Icons.arrow_drop_down;
                          _showOverlayContainer = false;
                        });
                        if (value != null) {}
                      },
                      onInterviewTypeFilterDone: (value) {
                        setState(() {
                          buttonIcon = Icons.arrow_drop_down;
                          _showOverlayContainer = false;
                        });
                        if (value != null) {}
                      },
                      onPlacementTypeFilterDone: (value) {
                        setState(() {
                          buttonIcon = Icons.arrow_drop_down;
                          _showOverlayContainer = false;
                        });
                        if (value != null) {}
                      },
                      onCollegesFilterDone: (value) {
                        setState(() {
                          buttonIcon = Icons.arrow_drop_down;
                          _showOverlayContainer = false;
                        });
                        if (value != null) {}
                      },
                    ),
                  ),
                )
              : Container(),
        ],
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
