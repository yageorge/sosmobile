import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../models/courseCategory.dart';
import '../courses/widgets/course_header.dart';
import '../courses/widgets/course_image.dart';

import 'widgets/feedbacks_list.dart';
import 'widgets/feedbacks_create.dart';

class Feedbacks extends StatefulWidget {
  static const routeName = '/users-feedback';

  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  Course course;
  CourseCategory category;
  Color categoryColor;

  Future initData() async {
    // Retrieving modalRoute arguments as params
    final args = ModalRoute.of(context).settings.arguments as Map;
    course = args['course'];
    category = course.category;
    categoryColor = Color(int.parse(category.colorVal));
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // Init data variables
    await initData();
  }

  void _newFeedbackWindow(
    BuildContext ctx,
  ) {
    showModalBottomSheet(
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: FeedbacksCreate(
            course: course,
          ),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // Using CustomScrollView to work with animations
                child: CustomScrollView(
                  slivers: [
                    // Animated SliverAppBar
                    SliverAppBar(
                      iconTheme: IconThemeData(
                        color: Colors.grey[900],
                      ),
                      expandedHeight: 102.0,
                      floating: true,
                      pinned: true,
                      snap: true,
                      backgroundColor: categoryColor,
                      flexibleSpace: FlexibleSpaceBar(
                        background: getCourseImage(
                          ratio: 5,
                          opacity: 0.9,
                          urlImage: course.urlImage,
                        ),
                      ),
                    ),

                    //Children items:
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            // Course name + category
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(16.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: categoryColor.withOpacity(0.2),
                                    blurRadius: 3.0,
                                  )
                                ],
                              ),
                              child: getCourseHeader(
                                context,
                                course.title,
                                category.name,
                                categoryColor,
                              ),
                            ),

                            // List of Feedbacks:
                            FeedbacksList(
                              courseId: course.id,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent.withOpacity(0.6),
        child: Icon(Icons.add),
        onPressed: () => _newFeedbackWindow(context),
      ),
    );
  }
}
