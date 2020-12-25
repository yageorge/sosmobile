import 'package:flutter/material.dart';

import '../../../../../models/course.dart';

import './widgets/property.dart';

class CourseView extends StatelessWidget {
  final Course course;

  const CourseView({
    Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2.5,
              child: Image.network(
                course.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 14, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Course Title
                          Text(
                            course.title,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline6,
                          ),

                          SizedBox(
                            height: 6,
                          ),

                          // Category Name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.category,
                                size: 16,
                                color: Theme.of(context).accentColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                course.categoryName,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14, left: 18, top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        property(
                          ctx: context,
                          icon: Icons.format_list_bulleted,
                          figure: course.totalLectures,
                        ),
                        property(
                          ctx: context,
                          icon: Icons.access_time,
                          figure: course.totalMinutes,
                        ),
                        property(
                          ctx: context,
                          icon: Icons.local_parking,
                          figure: course.points,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
