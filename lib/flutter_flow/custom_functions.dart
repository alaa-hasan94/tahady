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

double negativePrice(double price) {
  return price * -1;
}

double stripeTotal(double cartSum) {
  return cartSum * 100;
}

int addOne(int value) {
  return value + 1;
}

double percentageOf1(
  int num,
  int baseNum,
) {
  return num / baseNum;
}

String? percentageOf100(
  int num,
  int numBase,
) {
  int result = ((num / numBase) * 100).toInt();
  return '$result%';
}

String listToSring(List<String> inputList) {
  return inputList.join(" ");
}

String? phoneNumber(String? number) {
  if (number != null && number.startsWith('0')) {
    number = number.substring(1);
  }

  return number != null ? "+964$number" : null;
}
