import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

Map parseTranscript(transcript, dependencyTreeLocation) {
  bool firstTerm = true;
  List available = [];
  List taken = [];
  Map dep = {};
  String load = "";
  for (final term in transcript) {
    // print(term["period"]);
    // if (term["transcriptGpa"].length == 0) {
    //   print("first Term");
    // } else if (term["transcriptGpa"][0]["attemptedCredits"] == "0.00") {
    //   print("current Term");
    // } else {
    //   print("previous Term");
    // }

    final courses = term["transcriptOrganization"][0]["transcriptCourses"];

    for (var course in courses) {
      if (course["eventSubType"] != "Lecture" || course["finalGrade"] == "F") {
        continue;
      }
      final courseName = course["eventId"].toLowerCase();
      taken.add(courseName);

      if (!firstTerm) {
        if (dep.containsKey(courseName)) {
          available.addAll(dep[courseName][1]);
        }
        for (var takenCourse in taken) {
          available.remove(takenCourse);
        }
      }
    }

    if (firstTerm) {
      firstTerm = false;
      if (taken.contains("math100") && taken.contains("engl001")) {
        dep = dependencyTree("intensive", dependencyTreeLocation);
        load = "intensive";
        print(load);
      } else if (taken.contains("math100") && taken.contains("engl-101")) {
        dep = dependencyTree("mathIntensive", dependencyTreeLocation);
        load = "math intensive";
        print(load);
      } else if (taken.contains("math111") && taken.contains("engl001")) {
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
          available.addAll(dep[courseName][1]);
        }
        for (var takenCourse in taken) {
          available.remove(takenCourse);
        }
      }
    }
  }
  print("taken: $taken");
  print("available: $available");
  return {"taken": taken, "available": available};
}

Map dependencyTree(String studentCase, String dependencyTreeLocation) {
  final file = File(path.join(dependencyTreeLocation, "$studentCase.json"));
  final dependency = file.readAsStringSync();
  return (jsonDecode(dependency));
}
