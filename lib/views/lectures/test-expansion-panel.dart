// import 'package:flutter/material.dart';

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle: Text('To delete this panel, tap the trash can icon'),
//               trailing: Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   _data.removeWhere((currentItem) => item == currentItem);
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

//  Widget _buildPanel() {
//     List<Lecture> _lectures = widget.lectures;

//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _lectures[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _lectures.map<ExpansionPanel>((Lecture lecture) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(lecture.title),
//             );
//           },
//           body: ListTile(
//             // title: Text(lecture.title),
//             subtitle: Text(lecture.content),
//             trailing: Icon(Icons.done),
//           ),
//           isExpanded: lecture.isExpanded,
//         );
//       }).toList(),
//     );
//   }
