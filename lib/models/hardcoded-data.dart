import 'courseCategory.dart';
import 'lecture.dart';
import 'course.dart';

// Hard coded data for testing
final List<Course> coursesData = <Course>[
  Course(
    id: 1,
    title: "Complete Course Flutter 2.2 Framework",
    description: "Learn Flutter Framework and Dart Programming Language",
    urlImage: "https://flutter.dev/images/catalog-widget-placeholder.png",
    totalLectures: 146,
    totalMinutes: 234,
    points: 76,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: CourseCategory(
      id: 1,
      name: "Programming",
      colorVal: "0xFF0277BD",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    lectures: [
      Lecture(
        id: 0,
        title: "What is Flutter",
        content: '''
This year, mobile applications continued to become more and more popular. Fortunately there are many programming tools available to developers who want to create them. Among these tools there is Flutter, which has distinguished itself lately.

What is Flutter? Flutter is a free and open-source mobile UI framework created by Google and released in May 2017. In a few words, it allows you to create a native mobile application with only one codebase.

This means that you can use one programming language and one codebase to create two different apps (for iOS and Android).

Flutter consists of two important parts: An SDK (Software Development Kit): A collection of tools that are going to help you develop your applications.

This includes tools to compile your code into native machine code (code for iOS and Android).

A Framework (UI Library based on widgets): A collection of reusable UI elements (buttons, text inputs, sliders, and so on) that you can personalize for your own needs.

To develop with Flutter, you will use a programming language called Dart.

The language was created by Google in October 2011, but it has improved a lot over these past years.

Dart focuses on front-end development, and you can use it to create mobile and web applications.

If you know a bit of programming, Dart is a typed object programming language.

You can compare Dart's syntax to JavaScript''',
        urlVideo: "",
        duration: 18,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
      Lecture(
        id: 1,
        title: "Install Flutter - Vid 1",
        content:
            "This year, mobile applications continued to become more and more popular. Fortunately there are many programming tools available to developers who want to create them. Among these tools there is Flutter, which has distinguished itself lately",
        urlVideo: "https://youtu.be/1ukSR1GRtMU",
        duration: 26,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
      Lecture(
        id: 2,
        title: "Install Flutter SDK - Vid 2",
        content: "Install flutter detailsssdf sdf sdf sdfssss",
        urlVideo: "https://youtu.be/bKueYVtV0eA",
        duration: 16,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
      Lecture(
        id: 3,
        title: "Install Flusef sef sef sef se sftter",
        content: "Installefsefsef flutter f",
        urlVideo: "",
        duration: 6,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
      Lecture(
        id: 4,
        title: "Instwewefwfwefall Flusef sef sef sef se sftasdasdasdter",
        content: "Installefswfweffsef flutter f",
        urlVideo: "",
        duration: 13,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
      Lecture(
        id: 7,
        title: "Install Flusedddddf se sftter",
        content: "Installefsefsef flutter f",
        urlVideo: "",
        duration: 6,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
      Lecture(
        id: 3,
        title: "Install Fluswwwftter",
        content: "Installefsefsef flutter f",
        urlVideo: "",
        duration: 6,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
    ],
    isUserEnrolled: true,
    completedDate: null,
  ),
  Course(
    id: 2,
    title: "Learn ReactJS Framework",
    description: "Learn ReactJS Framework and Dart Programming Language",
    urlImage:
        "https://blog.wildix.com/wp-content/uploads/2020/06/react-logo.jpg",
    totalLectures: 66,
    totalMinutes: 124,
    points: 6,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: CourseCategory(
      id: 1,
      name: "Programming",
      colorVal: "0xFF0277BD",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    lectures: [
      Lecture(
        id: 3,
        title: "What is React JS",
        content: "React JS detailssssss",
        urlVideo: "",
        duration: 13,
        courseId: 2,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
      Lecture(
        id: 4,
        title: "Install React JS",
        content: "Install React JS detailssssss",
        urlVideo: "",
        duration: 16,
        courseId: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
    ],
    isUserEnrolled: true,
    completedDate: null,
  ),
  Course(
    id: 4,
    title: "Communicate Better",
    description: "Communicate Better description etc etc",
    urlImage:
        "https://zoetalentsolutions.com/wp-content/uploads/2017/04/Advanced-Communication-Skills-Training-Course.jpg",
    totalLectures: 9,
    totalMinutes: 14,
    points: 2,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: CourseCategory(
      id: 2,
      name: "Social skills training",
      colorVal: "0xFF64DD17",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    lectures: [
      Lecture(
        id: 5,
        title: "Type of Communications",
        content: "Communications detailssssss",
        urlVideo: "",
        duration: 8,
        courseId: 4,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
      Lecture(
        id: 6,
        title: "Improving Communications",
        content: "Improving Communications detailssssss",
        urlVideo: "",
        duration: 19,
        courseId: 4,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: true,
      ),
    ],
    isUserEnrolled: true,
    completedDate: null,
  ),
  Course(
    id: 5,
    title: "Fire Safety Phase 1 / 24 Training",
    description: "Fire Safety Training description etc etc",
    urlImage:
        "https://183263-537949-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/05/Fire-safety.jpg",
    totalLectures: 6,
    totalMinutes: 28,
    points: 2,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: CourseCategory(
      id: 3,
      name: "Safety",
      colorVal: "0xff9c27b0",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    lectures: [
      Lecture(
        id: 7,
        title: "Fire Safety details",
        content: '''
This year, mobile applications continued to become more and more popular. Fortunately there are many programming tools available to developers who want to create them. Among these tools there is Flutter, which has distinguished itself lately.

What is Flutter? Flutter is a free and open-source mobile UI framework created by Google and released in May 2017. In a few words, it allows you to create a native mobile application with only one codebase.

This means that you can use one programming language and one codebase to create two different apps (for iOS and Android).

Flutter consists of two important parts: An SDK (Software Development Kit): A collection of tools that are going to help you develop your applications.

This includes tools to compile your code into native machine code (code for iOS and Android).

A Framework (UI Library based on widgets): A collection of reusable UI elements (buttons, text inputs, sliders, and so on) that you can personalize for your own needs.

To develop with Flutter, you will use a programming language called Dart.

The language was created by Google in October 2011, but it has improved a lot over these past years.

Dart focuses on front-end development, and you can use it to create mobile and web applications.

If you know a bit of programming, Dart is a typed object programming language.

You can compare Dart's syntax to JavaScript''',
        urlVideo: "",
        duration: 6,
        courseId: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
      Lecture(
        id: 8,
        title: "How to run for your life",
        content: "How to run for your life detailssssss",
        urlVideo: "",
        duration: 11,
        courseId: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isCompleted: false,
      ),
    ],
    isUserEnrolled: false,
    completedDate: null,
  ),
];

List<CourseCategory> categoriesList = <CourseCategory>[
  CourseCategory(
    id: 1,
    name: "Programming",
    colorVal: "0xFF64DD17",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  CourseCategory(
    id: 2,
    name: "Social skills training",
    colorVal: "0xFF0277BD",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  CourseCategory(
    id: 3,
    name: "Safety",
    colorVal: "0xff9c27b0",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
