import 'package:isar/isar.dart';

//this line is needed to generate file
//then run: dart run build_runner build
part 'sakka.g.dart';

@Collection(inheritance: false)
class Sakka {
  Id id = Isar.autoIncrement;
  @ignore
  List lna_score_history = [];
  @ignore
  List lhm_score_history = [];
  int lna_score = 0;
  int lhm_score = 0;
  DateTime _dateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  bool isWinLna = false;
  bool isWinLhm = false;
}
