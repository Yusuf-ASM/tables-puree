import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:tables_puree/auth.dart' as auth;
import 'package:tables_puree/lumon.dart';
import 'package:tables_puree/students.dart';
import 'package:tables_puree/tables.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  var parser = ArgParser();

  parser.addOption("username", abbr: "u", defaultsTo: "potato", help: "Your account username");
  parser.addOption("password", abbr: "p", defaultsTo: "potato", help: "Your account password");
  parser.addOption(
    "tree-path",
    abbr: "t",
    valueHelp: "path",
    help:
        "Dependency tree location containing these files:\n- englIntensive.json\n- intensive.json\n- mathIntensive.json\n- normal.json",
  );
  parser.addOption("output", abbr: "o", valueHelp: "path", help: "Output path location");
  parser.addFlag("help", abbr: "h", help: "Help :)");
  parser.addFlag(
    "lumon",
    abbr: "l",
    defaultsTo: false,
    negatable: true,
    help: "If you know, you know",
  );

  final parsedArgs = parser.parse(arguments);

  if (parsedArgs.flag("help")) {
    print(parser.usage);
    exit(0);
  }

  if (parsedArgs.flag("lumon")) {
    intro(parsedArgs["username"][0]);
  }

  final api = auth.PowerCampusApi();
  await api.getUniToken(
    username: parsedArgs.option("username")!,
    password: parsedArgs.option("password")!,
  );
  final students = (await api.getAdvisees()).map(Student.fromJson).toList();
  final output = [];
  for (var student in students) {
    final transcript = await api.getTranscript(studentId: student.personId!);
    print(student.id);
    Map parsedTranscript = parseTranscript(transcript, parsedArgs.option("tree-path"));

    output.add({...parsedTranscript, ...student.toJson()});
  }
  print(path.absolute("."));
  if (parsedArgs.wasParsed("output")) {
    File(path.join(parsedArgs["output"])).writeAsStringSync(jsonEncode(output));
  }
  if (parsedArgs.flag("lumon")) {
    print("\nMr. Milchick is coming... Session Terminated!");
  } else {
    print("Good Luck.\n- SirPotato");
  }
}
