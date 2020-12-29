import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/courseCategory.dart';
import '../../../models/course.dart';
import '../../../models/lecture.dart';

import '../../courses/widgets/course_image.dart';
import '../../courses/widgets/course_header.dart';
import '../../../widgets/app_bar.dart';
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
    // Handle previous lecture tap
    void previousLecture() {
      // TODO
      // Should mark Lecture as done as well
      setState(() {
        index = index - 1;
        loadUrlVideo(index);
      });
    }

    // Handle next lecture tap
    void nextLecture() {
      // TODO
      // Should mark Lecture as done as well
      setState(() {
        index = index + 1;
        loadUrlVideo(index);
      });
    }

    return Scaffold(
      appBar: appBar(context, 'Lecture'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Course Image:
                      getCourseImage(
                        ratio: 5,
                        opacity: 0.9,
                        imageUrl: course.imageUrl,
                      ),

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
                        index: index,
                        lecture: lectures[index],
                      ),

                      // Video Rendering
                      if (lectures[index].urlVideo.isNotEmpty)
                        getVideoButton(
                          ctx: context,
                          urlId: urlId,
                        ),
                    ],
                  ),
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
