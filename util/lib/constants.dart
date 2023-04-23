/// Some aliases clash with reserved words of dartlang. Those are ignored.
const List<String> ignoredAliases = ["try"];

/// A map which adjusts icon ids starting with a number
///
/// Some icons cannot keep their id as identifier, as dart does not allow
/// numbers as the beginning of a variable names. The chosen solution is, to
/// write those parts out.
const Map<String, String> nameAdjustments = {
  "500px": "fiveHundredPx",
  "360-degrees": "threeHundredSixtyDegrees",
  "1": "one",
  "2": "two",
  "3": "three",
  "4": "four",
  "5": "five",
  "6": "six",
  "7": "seven",
  "8": "eight",
  "9": "nine",
  "0": "zero",
  "42-group": "fortyTwoGroup",
  "00": "zeroZero",
  "100": "hundred",
};

