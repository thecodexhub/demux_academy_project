import 'package:demux_academy_project/constants.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  final VoidCallback onClearButtonPressed;
  final Function(String) onTopicsFilterDone;
  final Function(String) onCompaniesFilterDone;
  final Function(String) onInterviewTypeFilterDone;
  final Function(String) onPlacementTypeFilterDone;
  final Function(String) onCollegesFilterDone;

  Filter({
    Key key,
    this.onClearButtonPressed,
    this.onTopicsFilterDone,
    this.onCompaniesFilterDone,
    this.onInterviewTypeFilterDone,
    this.onPlacementTypeFilterDone,
    this.onCollegesFilterDone,
  }) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _selectedTopicIndex;
  int _selectedCompanyIndex;
  int _selectedInterviewIndex;
  int _selectedPlacementIndex;
  int _selectedCollegeIndex;

  List<String> _topics = [
    'Array',
    'Math',
    'Dynamic Programming',
  ];

  List<String> _companies = [
    'Google',
    'Facebook',
    'Apple',
    'Microsoft',
    'Amazon',
  ];

  List<String> _interviewType = [
    'Online',
    'Pen-paper',
    'Interview',
  ];

  List<String> _placementType = [
    'Placement',
    'Internship',
  ];

  List<String> _colleges = [
    'NIT Durgapur',
    'IIT Kharagpur',
    'IIT Delhi',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  *************** Topics *******************
                  Text(
                    'Topics :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    spacing: 6.0,
                    direction: Axis.horizontal,
                    children: _topics.map((topic) {
                      var itemIndex = _topics.indexOf(topic);
                      return ActionChip(
                        backgroundColor: itemIndex == _selectedTopicIndex
                            ? Colors.deepOrange[50]
                            : Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: itemIndex == _selectedTopicIndex
                                  ? Colors.deepOrange[400]
                                  : Colors.grey[400]),
                        ),
                        label: Text(topic),
                        onPressed: () {
                          setState(() {
                            _selectedTopicIndex = itemIndex;
                          });
                          String param = _selectedTopicIndex == null
                              ? ''
                              : _topics[_selectedTopicIndex];
                          widget.onTopicsFilterDone(param);
                        },
                      );
                    }).toList(),
                  ),

                  // ***************** Companies *******************
                  Text(
                    'Companies :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    spacing: 6.0,
                    direction: Axis.horizontal,
                    children: _companies.map((company) {
                      var itemIndex = _companies.indexOf(company);
                      return ActionChip(
                        backgroundColor: itemIndex == _selectedCompanyIndex
                            ? Colors.deepOrange[50]
                            : Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: itemIndex == _selectedCompanyIndex
                                  ? Colors.deepOrange[400]
                                  : Colors.grey[400]),
                        ),
                        label: Text(company),
                        onPressed: () {
                          setState(() {
                            _selectedCompanyIndex = itemIndex;
                          });
                          String param = _selectedCompanyIndex == null
                              ? ''
                              : _companies[_selectedCompanyIndex];
                          widget.onCompaniesFilterDone(param);
                        },
                      );
                    }).toList(),
                  ),

                  // ******************* Interview Type*******************
                  Text(
                    'Type of interview :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    spacing: 6.0,
                    direction: Axis.horizontal,
                    children: _interviewType.map((type) {
                      var itemIndex = _interviewType.indexOf(type);
                      return ActionChip(
                        backgroundColor: itemIndex == _selectedInterviewIndex
                            ? Colors.deepOrange[50]
                            : Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: itemIndex == _selectedInterviewIndex
                                  ? Colors.deepOrange[400]
                                  : Colors.grey[400]),
                        ),
                        label: Text(type),
                        onPressed: () {
                          setState(() {
                            _selectedInterviewIndex = itemIndex;
                          });
                          String param = _selectedInterviewIndex == null
                              ? ''
                              : _interviewType[_selectedInterviewIndex]
                                  .toLowerCase();
                          widget.onInterviewTypeFilterDone(param);
                        },
                      );
                    }).toList(),
                  ),

                  // ******************* Placement Type*******************
                  Text(
                    'Type of job :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    spacing: 6.0,
                    direction: Axis.horizontal,
                    children: _placementType.map((type) {
                      var itemIndex = _placementType.indexOf(type);
                      return ActionChip(
                        backgroundColor: itemIndex == _selectedPlacementIndex
                            ? Colors.deepOrange[50]
                            : Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: itemIndex == _selectedPlacementIndex
                                  ? Colors.deepOrange[400]
                                  : Colors.grey[400]),
                        ),
                        label: Text(type),
                        onPressed: () {
                          setState(() {
                            _selectedPlacementIndex = itemIndex;
                          });
                          String param = _selectedPlacementIndex == null
                              ? ''
                              : _placementType[_selectedPlacementIndex]
                                  .toLowerCase();
                          widget.onPlacementTypeFilterDone(param);
                        },
                      );
                    }).toList(),
                  ),

                  // ********************* Colleges*****************
                  Text(
                    'Colleges :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    spacing: 6.0,
                    direction: Axis.horizontal,
                    children: _colleges.map((college) {
                      var itemIndex = _colleges.indexOf(college);
                      return ActionChip(
                        backgroundColor: itemIndex == _selectedCollegeIndex
                            ? Colors.deepOrange[50]
                            : Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: itemIndex == _selectedCollegeIndex
                                  ? Colors.deepOrange[400]
                                  : Colors.grey[400]),
                        ),
                        label: Text(college),
                        onPressed: () {
                          setState(() {
                            _selectedCollegeIndex = itemIndex;
                          });
                          String param = _selectedCollegeIndex == null
                              ? ''
                              : _colleges[_selectedCollegeIndex];
                          widget.onCollegesFilterDone(param);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey[400]),
              ),
              onPressed: () {
                widget.onClearButtonPressed();
              },
              child: Text('Clear Filters'),
            ),
          ],
        ),
        SizedBox(height: 6.0),
      ],
    );
  }
}
