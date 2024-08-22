// THIS FILE WAS AUTO GENERATED. MODIFY WITH CAUTION!
// See https://supadart.vercel.app
// ignore_for_file: non_constant_identifier_names, camel_case_types, file_namesimport, file_names
library models;

import 'package:mobx/mobx.dart';
import 'package:supabase/supabase.dart';

part 'models.g.dart';

extension DatabaseClient on SupabaseClient {
  SupabaseStreamFilterBuilder get frequencies =>
      from(FrequencyDataStore.table_name).stream(primaryKey: [FrequencyDataStore.id_column]);
  SupabaseStreamFilterBuilder get chores =>
      from(ChoreDataStore.table_name).stream(primaryKey: [ChoreDataStore.id_column]);
  SupabaseStreamFilterBuilder get users =>
      from(UserDataStore.table_name).stream(primaryKey: [UserDataStore.id_column]);
}

abstract class Model {
  final List<String> columns;

  const Model(this.columns);

  static Model fromJson<T>(Map<String, dynamic> data) {
    if (FrequencyDataStore._columns.every((element) => data.keys.contains(element)))
      return FrequencyDataStore.fromJson(data) as Model;
    else if (ChoreDataStore._columns.every((element) => data.keys.contains(element)))
      return ChoreDataStore.fromJson(data) as Model;
    else if (UserDataStore._columns.every((element) => data.keys.contains(element)))
      return UserDataStore.fromJson(data) as Model;
    else
      throw new UnsupportedError("The given JSON is unsupported.");
  }

  static List<Model> fromJsonList<T>(List<Map<String, dynamic>> data) {
    return data.map(Model.fromJson<T>).toList();
  }
}

class Frequency = FrequencyDataStore with _$Frequency;

abstract class FrequencyDataStore extends Model with Store {
  final BigInt id;
  final DateTime created_at;
  @observable
  String title;
  @observable
  double? frequency;
  @observable
  String? description;

  FrequencyDataStore({
    required this.id,
    required this.created_at,
    required this.title,
    this.frequency,
    this.description,
  }) : super(_columns);

  static const String table_name = 'frequencies';
  static const String id_column = 'id';
  static const String created_at_column = 'created_at';
  static const String title_column = 'title';
  static const String frequency_column = 'frequency';
  static const String description_column = 'description';
  static const List<String> _columns = [
    id_column,
    created_at_column,
    title_column,
    frequency_column,
    description_column,
  ];

  static Map<String, dynamic> insert({
    BigInt? id,
    DateTime? created_at,
    required String title,
    double? frequency,
    String? description,
  }) {
    return {
      if (id != null) 'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      'title': title.toString(),
      if (frequency != null) 'frequency': frequency.toString(),
      if (description != null) 'description': description.toString(),
    };
  }

  static Map<String, dynamic> update({
    required BigInt id,
    DateTime? created_at,
    String? title,
    double? frequency,
    String? description,
  }) {
    return {
      'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      if (title != null) 'title': title.toString(),
      if (frequency != null) 'frequency': frequency.toString(),
      if (description != null) 'description': description.toString(),
    };
  }

  factory FrequencyDataStore.fromJson(Map<String, dynamic> json) {
    return Frequency(
      id: json['id'] != null ? BigInt.tryParse(json['id'].toString()) as BigInt : BigInt.from(0),
      created_at: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString()) as DateTime
          : DateTime.fromMillisecondsSinceEpoch(0),
      title: json['title'] != null ? json['title'].toString() : '',
      frequency: json['frequency'] != null ? double.tryParse(json['frequency'].toString()) : 0.0,
      description: json['description'] != null ? json['description'].toString() : '',
    );
  }
}

class Chore = ChoreDataStore with _$Chore;

abstract class ChoreDataStore extends Model with Store {
  final BigInt id;
  final DateTime created_at;
  @observable
  late DateTime updated_at;
  @observable
  String created_by;
  @observable
  String chore;
  @observable
  BigInt? frequency;
  @observable
  bool completed;
  @observable
  String? completed_by;
  @observable
  String? assignee;
  @observable
  String? notes;

  ChoreDataStore({
    required this.id,
    required this.created_at,
    DateTime? updated_at,
    required this.created_by,
    required this.chore,
    this.frequency,
    required this.completed,
    this.completed_by,
    this.assignee,
    this.notes,
  }) : super(_columns) {
    this.updated_at = updated_at ?? this.created_at;
  }

  static const String table_name = 'chores';
  static const String id_column = 'id';
  static const String created_at_column = 'created_at';
  static const String updated_at_column = 'updated_at';
  static const String created_by_column = 'created_by';
  static const String chore_column = 'chore';
  static const String frequency_column = 'frequency';
  static const String completed_column = 'completed';
  static const String completed_by_column = 'completed_by';
  static const String assignee_column = 'assignee';
  static const String notes_column = 'notes';
  static const List<String> _columns = [
    id_column,
    created_at_column,
    updated_at_column,
    created_by_column,
    chore_column,
    frequency_column,
    completed_column,
    completed_by_column,
    assignee_column,
    notes_column,
  ];

  static Map<String, dynamic> insert({
    BigInt? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? created_by,
    required String chore,
    BigInt? frequency,
    required bool completed,
    String? completed_by,
    String? assignee,
    String? notes,
  }) {
    return {
      if (id != null) 'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      if (updated_at != null) 'updated_at': updated_at.toUtc().toString(),
      if (created_by != null) 'created_by': created_by.toString(),
      'chore': chore.toString(),
      if (frequency != null) 'frequency': frequency.toString(),
      'completed': completed.toString(),
      if (completed_by != null) 'completed_by': completed_by.toString(),
      if (assignee != null) 'assignee': assignee.toString(),
      if (notes != null) 'notes': notes.toString(),
    };
  }

  static Map<String, dynamic> update({
    required BigInt id,
    DateTime? created_at,
    DateTime? updated_at,
    String? created_by,
    String? chore,
    BigInt? frequency,
    bool? completed,
    String? completed_by,
    String? assignee,
    String? notes,
  }) {
    return {
      'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      if (updated_at != null) 'updated_at': updated_at.toUtc().toString(),
      if (created_by != null) 'created_by': created_by.toString(),
      if (chore != null) 'chore': chore.toString(),
      if (frequency != null) 'frequency': frequency.toString(),
      if (completed != null) 'completed': completed.toString(),
      if (completed_by != null) 'completed_by': completed_by.toString(),
      if (assignee != null) 'assignee': assignee.toString(),
      if (notes != null) 'notes': notes.toString(),
    };
  }

  factory ChoreDataStore.fromJson(Map<String, dynamic> json) {
    return Chore(
      id: json['id'] != null ? BigInt.tryParse(json['id'].toString()) as BigInt : BigInt.from(0),
      created_at: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString()) as DateTime
          : DateTime.fromMillisecondsSinceEpoch(0),
      updated_at: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString()) as DateTime
          : DateTime.fromMillisecondsSinceEpoch(0),
      created_by: json['created_by'] != null ? json['created_by'].toString() : '',
      chore: json['chore'] != null ? json['chore'].toString() : '',
      frequency: json['frequency'] != null
          ? BigInt.tryParse(json['frequency'].toString()) as BigInt
          : BigInt.from(0),
      completed: json['completed'] != null ? json['completed'] as bool : false,
      completed_by: json['completed_by'] != null ? json['completed_by'].toString() : '',
      assignee: json['assignee'] != null ? json['assignee'].toString() : '',
      notes: json['notes'] != null ? json['notes'].toString() : '',
    );
  }
}

class User = UserDataStore with _$User;

abstract class UserDataStore extends Model with Store {
  final String id;
  final DateTime created_at;
  @observable
  bool guest;

  UserDataStore({
    required this.id,
    required this.created_at,
    this.guest = false,
  }) : super(_columns);

  static const String table_name = 'users';
  static const String id_column = 'id';
  static const String created_at_column = 'created_at';
  static const String guest_column = 'guest';
  static const List<String> _columns = [
    id_column,
    created_at_column,
    guest_column,
  ];

  static Map<String, dynamic> insert({
    String? id,
    DateTime? created_at,
    required bool guest,
  }) {
    return {
      if (id != null) 'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      'guest': guest.toString(),
    };
  }

  static Map<String, dynamic> update({
    required String id,
    DateTime? created_at,
    bool? guest,
  }) {
    return {
      'id': id.toString(),
      if (created_at != null) 'created_at': created_at.toUtc().toString(),
      if (guest != null) 'guest': guest.toString(),
    };
  }

  factory UserDataStore.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] != null ? json['id'].toString() : '',
      created_at: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString()) as DateTime
          : DateTime.fromMillisecondsSinceEpoch(0),
      guest: json['guest'] != null ? json['guest'] as bool : false,
    );
  }
}
