import 'package:anber/Models/sakka.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class SakkaDatabase extends ChangeNotifier {
  static late Isar isar;

  // ININITIALIZE - DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([SakkaSchema], directory: dir.path);
  }

  //list of sakkas
  final List<Sakka> currentSakkas = [];

  //CREATE - a sakka and save to db
  Future<int> CreateSakka() async {
    //create a new sakka object
    final newSakka = Sakka();

    //save to db
    int _id = await isar.writeTxn(() => isar.sakkas.put(newSakka));

    //re-read from db
    fetchSakkas();
    return _id;
  }

  //READ - sakkas from db
  Future<void> fetchSakkas() async {
    List<Sakka> fetchedSakkas = await isar.sakkas.where().findAll();
    currentSakkas.clear();
    currentSakkas.addAll(fetchedSakkas);
    notifyListeners();
  }

  // INCREASE SCORE - a current sakka in db
  Future<void> increaseScore(int id, int lhm_score, int lna_score) async {
    final existingSakka = await isar.sakkas.get(id);
    if (existingSakka != null) {
      existingSakka.lhm_score += lhm_score;
      // existingSakka.lhm_score_history.add(lhm_score);

      existingSakka.lna_score += lna_score;
      // existingSakka.lna_score_history.add(lna_score);
      await isar.writeTxn(() => isar.sakkas.put(existingSakka));
      await fetchSakkas();
      await isWinning(id);
    }
  }

  Future<void> isWinning(int id) async {
    final existingSakka = await isar.sakkas.get(id);
    if (existingSakka != null) {
      int lhm = existingSakka.lhm_score;
      int lna = existingSakka.lna_score;

      if (lna >= 152 || lhm >= 152) {
        if (lna > lhm) {
          existingSakka.isWinLna = true;
        } else if (lhm > lna) {
          existingSakka.isWinLhm = true;
        }
      }
    }
  }

  // Get the current sakka score
  Future<List> GetScore(int id) async {
    final existingSakka = await isar.sakkas.get(id);
    if (existingSakka != null) {
      List a = [];
      a.add(existingSakka.lna_score);
      // a.add(existingSakka.lna_score_history);
      a.add(existingSakka.lhm_score);
      // a.add(existingSakka.lhm_score_history);
      return a;
    }
    return [];
  }

  //removeLastScore - a current sakka in db
  Future<void> removeLastScore(int id, int last_lna, int last_lhm) async {
    final existingSakka = await isar.sakkas.get(id);
    if (existingSakka != null) {
      existingSakka.lna_score -= last_lna;
      existingSakka.lhm_score -= last_lhm;
      await isar.writeTxn(() => isar.sakkas.put(existingSakka));
      await fetchSakkas();
    }
  }

  Future<void> sakkaEnded(int id) async {
    if (currentSakkas.last.lhm_score >= 152 ||
        currentSakkas.last.lna_score >= 152) {
    } else {
      deleteSakka(id);
    }
  }

  //DELETE - a note from db
  Future<void> deleteSakka(int id) async {
    await isar.writeTxn(() => isar.sakkas.delete(id));

    await fetchSakkas();
  }
}
