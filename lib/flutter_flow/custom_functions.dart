import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool choiceTagInDest(
  List<String> destTags,
  List<String> choiceTags,
) {
  if (choiceTags.isEmpty) {
    return true;
  }

  for (int i = 0; i < choiceTags.length; i++) {
    if (destTags.contains(choiceTags[i])) {
      return true;
    }
  }
  return false;
}

int? calculateDaysBetweenNumber(
  DateTime? start,
  DateTime? end,
) {
  if (start == null || end == null) {
    return null;
  }

  final diff = math.max(0, end!.difference(start!).inDays);
  return diff;
}

String calculateDaysBetween(
  DateTime? start,
  DateTime? end,
) {
  if (start == null || end == null) {
    return "---";
  }

  final diff = math.max(0, end!.difference(start!).inDays);
  return "$diff ${diff == 1 ? 'Day' : 'Days'}";
}

bool dateTimeisNull(DateTime? dateTime) {
  return dateTime == null;
}

int sumOfList(List<int> lst) {
  return lst.reduce((a, b) => a + b);
}

DateTime? whichDateIsLater(
  DateTime? date1,
  DateTime? date2,
) {
  // return which datetime is later
  if (date1 == null) {
    return date2;
  } else if (date2 == null) {
    return date1;
  }
  if (date1.isAfter(date2)) {
    return date1;
  } else {
    return date2;
  }
}
