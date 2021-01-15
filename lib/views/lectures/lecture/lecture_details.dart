import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/courses_provider.dart';
import '../../../services/sharedPrefs.dart';
import '../../../models/courseCategory.dart';
import '../../../models/course.dart';
import '../../../models/lecture.dart';

import '../../courses/widgets/course_image.dart';
import '../../courses/widgets/course_header.dart';
import 'widgets/body.dart';
import 'widgets/nav_buttons.dart';
import 'widgets/video_button.dart';

class LectureDetails extends StatefulWidget {
  static const routeName = '/lecture';

  @override
  _LectureDetailsState createState() => _LectureDetailsState();
}

class _LectureDetailsState extends State<LectureDetails> {
  Course course;
  CourseCategory category;
  Color categoryColor;
  List<Lecture> lectures;
  int index;
  String urlVideo;
  String urlId;

  // loading video info if existing:
  void loadUrlVideo(int _index) {
    if (lectures[_index].urlVideo.isNotEmpty) {
      urlVideo = lectures[_index].urlVideo;
      urlId = YoutubePlayer.convertUrlToId(urlVideo);
    }
  }

  Future initData() async {
    // Retrieving modalRoute arguments as params
    final args = ModalRoute.of(context).settings.arguments as Map;
    course = args['course'];
    category = course.category;
    categoryColor = Color(int.parse(category.colorVal));
    lectures = args['lectures'];
    index = args['index'];

    loadUrlVideo(index);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // Init data variables
    await initData();
  }

  @override
  Widget build(BuildContext context) {
    CoursesProvider _coursesProvider = Provider.of<CoursesProvider>(context);

    // Handle previous lecture tap
    void previousLecture() {
      setState(() {
        index = index - 1;
        loadUrlVideo(index);
      });
    }

    // Handle next lecture tap
    void nextLecture() {
      setState(() {
        index = index + 1;
        loadUrlVideo(index);
      });
    }

    void isCompletedToggleCallBack(int currentLectureIndex) {
      // setState to refresh the isComplete boolean
      setState(() {
        index = currentLectureIndex;
      });
    }

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
                      expandedHeight: 132.0,
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
                              margin: EdgeInsets.only(bottom: 16),
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

                            // Lecture Body:
                            getLectureBody(
                              ctx: context,
                              coursesProvider: _coursesProvider,
                              index: index,
                              lecture: lectures[index],
                              userId: sharedPrefs.userId,
                              callBack: isCompletedToggleCallBack,
                            ),

                            // Video Thumbnail Button
                            if (lectures[index].urlVideo.isNotEmpty)
                              getVideoButton(
                                ctx: context,
                                urlId: urlId,
                              ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),

              // Buttons Previous Next
              getNavButtons(
                index: index,
                lecturesLength: lectures.length,
                previousLectureFn: () => previousLecture(),
                nextLectureFn: () => nextLecture(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
