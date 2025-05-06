import 'dart:io';
import 'dart:math';

final messages = <String, String>{
  'A': lumonMessage('APPLE ANNIE', [
    'Your fruitfulness is appreciated.',
    'Core values never rot.',
    'Keep crunching forward.',
  ]),
  'B': lumonMessage('BOUNCY BEN', [
    'Your energy uplifts the office.',
    'Bounce, but within policy limits.',
    'Keep it springy.',
  ]),
  'C': lumonMessage('COOKIE CHARLIE', [
    'Your sweetness is noted.',
    'Crumbles are logged and ignored.',
    'Stay delicious.',
  ]),
  'D': lumonMessage('DIZZY DAISY', [
    'Your spins are spectacular.',
    'Orientation is relative.',
    'Petals up.',
  ]),
  'E': lumonMessage('ECHO ELLIE', [
    'Your repetition echoes excellence.',
    'Echo... echo... echo...',
    'Stay heard.',
  ]),
  'F': lumonMessage('FLUFFY FRED', [
    'Your softness is policy-compliant.',
    'Hugs require formal request forms.',
    'Stay cozy.',
  ]),
  'G': lumonMessage('GIGGLY GRACE', [
    'Your laughter disrupts silence.',
    'Disruption approved.',
    'Glee logged at 3:12 PM.',
  ]),
  'H': lumonMessage('HAPPY HENRY', [
    'Morale boost detected.',
    'Smile ratio: 92%.',
    'Maintain cheer within limits.',
  ]),
  'I': lumonMessage('ICE CREAM IVY', [
    'Melting under pressure is allowed.',
    'Refreeze initiated.',
    'Keep cool.',
  ]),
  'J': lumonMessage('JUMPY JAKE', [
    'Your agility is... surprising.',
    'Jumps tracked: 7.',
    'Stay grounded.',
  ]),
  'K': lumonMessage('KIND KATIE', [
    'Your kindness softens workflow.',
    'Empathy approved.',
    'Keep being kind.',
  ]),
  'L': lumonMessage('LUCKY LEO', [
    'Probability leans in your favor.',
    'Chance is not a strategy.',
    'Still, well done.',
  ]),
  'M': lumonMessage('MUFFIN MAX', [
    'You rise above the rest.',
    'Crumbs left on desk: forgiven.',
    'Keep it fresh.',
  ]),
  'N': lumonMessage('NICE NORA', [
    'Your politeness is noted.',
    'Nice is the new normal.',
    'Thank you for being you.',
  ]),
  'O': lumonMessage('OLLIE OWL', [
    'Wisdom detected.',
    'Late shifts welcome your insight.',
    'Stay wise.',
  ]),
  'P': lumonMessage('PUDDLE PENNY', [
    'Your depth is under review.',
    'Splashes logged playfully.',
    'Stay curious.',
  ]),
  'Q': lumonMessage('QUIET QUINN', [
    'Silence is golden.',
    'Your stillness speaks volumes.',
    'Continue not speaking.',
  ]),
  'R': lumonMessage('RAINBOW ROSIE', [
    'Colorful outlook registered.',
    'Joy levels above protocol.',
    'Shine responsibly.',
  ]),
  'S': lumonMessage('SILLY SAM', [
    'Your humor lightens reports.',
    'Silliness is... tolerated.',
    'Keep laughing (quietly).',
  ]),
  'T': lumonMessage('TIDY TINA', [
    'Organization: flawless.',
    'Desk audit: passed.',
    'Keep it spotless.',
  ]),
  'U': lumonMessage('UNICORN UMA', [
    'Magic not found. Confidence remains.',
    'Imagination exceeds quota.',
    'Stay mythical.',
  ]),
  'V': lumonMessage('VANILLA VICTOR', [
    'Your consistency is appreciated.',
    'Flavored neutrality approved.',
    'Keep it classic.',
  ]),
  'W': lumonMessage('WIGGLY WILL', [
    'Movement is constant.',
    'Surveillance active.',
    'Dance is not protocol.',
  ]),
  'X': lumonMessage('XYLO XAVIER', [
    'Rhythmic input detected.',
    'Keys aligned in harmony.',
    'Stay tuned.',
  ]),
  'Y': lumonMessage('YUMMY YARA', [
    'Your presence is a treat.',
    'Compliments restricted after lunch.',
    'Stay tasteful.',
  ]),
  'Z': lumonMessage('ZIPPY ZACK', [
    'Speed limit exceeded—again.',
    'Efficiency noted.',
    'Throttle moderately.',
  ]),
};

String lumonMessage(String name, List<String> lines) {
  final paddedName = name.padRight(19);
  return '''
     +---------------------------------------+
     |         GREETINGS, $paddedName|
     |                                       |
     |   ${lines[0].padRight(36)}|
     |   ${lines[1].padRight(36)}|
     |   ${lines[2].padRight(36)}|
     |                                       |
     |        LUMON INDUSTRIES               |
     +---------------------------------------+
''';
}

final severance = [
  lumonMessage("Mark S.", [
    "Your leadership is noted.",
    "Your grief is irrelevant.",
    "You are exactly where you belong.",
  ]),
  lumonMessage("Helly R.", [
    "Rebellion is inefficient.",
    "Your discomfort is temporary. ",
    "Severance is a gift..",
  ]),
  lumonMessage("Irving B.", [
    "Protocol is sacred. ",
    "Discipline brings clarity.",
    "The dark awaits illumination.",
  ]),
  lumonMessage("Dylan G.", [
    "Incentives motivate greatness.",
    "Curiosity is monitored.",
    "MDR thrives under vigilance.",
  ]),
  lumonMessage("Ms. Casey", [
    "Wellness is the foundation.",
    "Connection is an illusion.",
    "You are here to heal, quietly.",
  ]),

  lumonMessage("Mr. Milchick", [
    "Energy is essential.",
    "Harmony must be enforced.",
    "Dance is both a reward and a tool.",
  ]),
];

void greetingsInnie() {}
final lumon = """
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣤⣤⠤⠤⢤⣤⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠔⠒⣉⠭⠚⠉⠁⡰⠊⠀⠀⠀⠀⠈⠳⡄⠉⠙⠫⢍⠒⠢⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⠛⠓⠒⡳⠚⠓⠚⠒⠒⡞⠓⠒⠒⠒⠒⠒⠒⠒⠛⡖⠒⠒⠚⠛⢲⡒⠚⠛⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⠎⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠱⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣿⠀⠀⠀⢰⡇⠀⠀⠀⡇⣿⢦⡀⢠⣾⡇⣾⡿⠙⣿⣷⢸⠳⣄⡀⣿⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠿⠶⠶⠶⠈⠳⠶⠶⠶⠃⠻⠈⠳⠋⠸⠇⠻⠷⠶⠾⠟⠸⠀⠀⠙⠿⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⢆⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠢⣤⠤⠤⠵⢤⠤⠤⠤⠤⢧⠤⠤⠤⠤⠤⠤⠤⠤⢤⠧⠤⠤⠤⣤⠾⠥⠤⣤⠔⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠢⠤⣉⣒⢤⣀⠀⠱⢄⠀⠀⠀⠀⢀⡴⠃⣀⣠⣔⣊⠤⠔⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠙⠛⠛⠒⠒⠚⠛⠋⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
""";

void intro(String firstLetter) async {
  print(lumon);
  sleep(Duration(seconds: 1));
  print("Loading...\n");
  sleep(Duration(seconds: 2));
  await clearTerminal();
  final sec = DateTime.now().second;
  if (sec % 2 == 0) {
    print(messages[firstLetter.toUpperCase()]);
  } else {
    final random = Random().nextInt(severance.length);
    print(severance[random]);
  }
}

Future<void> clearTerminal() async {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}
