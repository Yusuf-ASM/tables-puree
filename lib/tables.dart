import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

Map parseTranscript(transcript, dependencyTreeLocation) {
  bool firstTerm = true;
  List availableCourses = [];
  List takenCourses = [];
  Map dep = {};
  String load = "";
  for (final term in transcript) {
    final courses = term["transcriptOrganization"][0]["transcriptCourses"];

    for (var course in courses) {
      if (course["eventSubType"] != "Lecture" || course["finalGrade"] == "F") {
        continue;
      }

      final courseName = course["eventId"].toLowerCase();
      takenCourses.add(courseName);

      if (!firstTerm) {
        if (dep.containsKey(courseName)) {
          for (final course in dep[courseName][1]) {
            if (dep[course][0].length == 1 || listIntersect(dep[course][0], takenCourses)) {
              availableCourses.add(course);
            }
          }
        }

        for (var takenCourse in takenCourses) {
          availableCourses.remove(takenCourse);
        }
      }
    }

    if (firstTerm) {
      firstTerm = false;
      if (takenCourses.contains("math100") && takenCourses.contains("engl001")) {
        dep = dependencyTree("intensive", dependencyTreeLocation);
        load = "intensive";
        print(load);
      } else if (takenCourses.contains("math100") && takenCourses.contains("engl-101")) {
        dep = dependencyTree("mathIntensive", dependencyTreeLocation);
        load = "math intensive";
        print(load);
      } else if (takenCourses.contains("math111") && takenCourses.contains("engl001")) {
        dep = dependencyTree("englIntensive", dependencyTreeLocation);
        load = "engl intensive";
        print(load);
      } else {
        dep = dependencyTree("normal", dependencyTreeLocation);
        load = "normal";
        print(load);
      }

      for (var course in courses) {
        if (course["eventSubType"] != "Lecture" || course["finalGrade"] == "F") {
          continue;
        }

        final courseName = course["eventId"].toLowerCase();

        if (dep.containsKey(courseName)) {
          for (final course in dep[courseName][1]) {
            if (dep[course][0].length == 1 || listIntersect(dep[course][0], takenCourses)) {
              availableCourses.add(course);
            }
          }
        }
        
        for (var takenCourse in takenCourses) {
          availableCourses.remove(takenCourse);
        }
      }
    }
  }
  print("taken: $takenCourses");
  print("available: $availableCourses");
  return {"taken": takenCourses, "available": availableCourses};
}

Map dependencyTree(String studentCase, String dependencyTreeLocation) {
  final file = File(path.join(dependencyTreeLocation, "$studentCase.json"));
  final dependency = file.readAsStringSync();
  return (jsonDecode(dependency));
}

bool listIntersect(List listA, List listB) {
  bool result = true;
  for (var element in listA) {
    result = result & listB.contains(element);
  }
  return result;
}
