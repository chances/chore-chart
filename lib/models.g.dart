// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Frequency on FrequencyDataStore, Store {
  late final _$titleAtom =
      Atom(name: 'FrequencyDataStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$frequencyAtom =
      Atom(name: 'FrequencyDataStore.frequency', context: context);

  @override
  double? get frequency {
    _$frequencyAtom.reportRead();
    return super.frequency;
  }

  @override
  set frequency(double? value) {
    _$frequencyAtom.reportWrite(value, super.frequency, () {
      super.frequency = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'FrequencyDataStore.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
frequency: ${frequency},
description: ${description}
    ''';
  }
}

mixin _$Chore on ChoreDataStore, Store {
  late final _$updated_atAtom =
      Atom(name: 'ChoreDataStore.updated_at', context: context);

  @override
  DateTime get updated_at {
    _$updated_atAtom.reportRead();
    return super.updated_at;
  }

  bool _updated_atIsInitialized = false;

  @override
  set updated_at(DateTime value) {
    _$updated_atAtom.reportWrite(
        value, _updated_atIsInitialized ? super.updated_at : null, () {
      super.updated_at = value;
      _updated_atIsInitialized = true;
    });
  }

  late final _$created_byAtom =
      Atom(name: 'ChoreDataStore.created_by', context: context);

  @override
  String get created_by {
    _$created_byAtom.reportRead();
    return super.created_by;
  }

  @override
  set created_by(String value) {
    _$created_byAtom.reportWrite(value, super.created_by, () {
      super.created_by = value;
    });
  }

  late final _$choreAtom = Atom(name: 'ChoreDataStore.chore', context: context);

  @override
  String get chore {
    _$choreAtom.reportRead();
    return super.chore;
  }

  @override
  set chore(String value) {
    _$choreAtom.reportWrite(value, super.chore, () {
      super.chore = value;
    });
  }

  late final _$frequencyAtom =
      Atom(name: 'ChoreDataStore.frequency', context: context);

  @override
  BigInt? get frequency {
    _$frequencyAtom.reportRead();
    return super.frequency;
  }

  @override
  set frequency(BigInt? value) {
    _$frequencyAtom.reportWrite(value, super.frequency, () {
      super.frequency = value;
    });
  }

  late final _$completedAtom =
      Atom(name: 'ChoreDataStore.completed', context: context);

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$completed_byAtom =
      Atom(name: 'ChoreDataStore.completed_by', context: context);

  @override
  String? get completed_by {
    _$completed_byAtom.reportRead();
    return super.completed_by;
  }

  @override
  set completed_by(String? value) {
    _$completed_byAtom.reportWrite(value, super.completed_by, () {
      super.completed_by = value;
    });
  }

  late final _$assigneeAtom =
      Atom(name: 'ChoreDataStore.assignee', context: context);

  @override
  String? get assignee {
    _$assigneeAtom.reportRead();
    return super.assignee;
  }

  @override
  set assignee(String? value) {
    _$assigneeAtom.reportWrite(value, super.assignee, () {
      super.assignee = value;
    });
  }

  late final _$notesAtom = Atom(name: 'ChoreDataStore.notes', context: context);

  @override
  String? get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(String? value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  @override
  String toString() {
    return '''
updated_at: ${updated_at},
created_by: ${created_by},
chore: ${chore},
frequency: ${frequency},
completed: ${completed},
completed_by: ${completed_by},
assignee: ${assignee},
notes: ${notes}
    ''';
  }
}

mixin _$User on UserDataStore, Store {
  late final _$guestAtom = Atom(name: 'UserDataStore.guest', context: context);

  @override
  bool get guest {
    _$guestAtom.reportRead();
    return super.guest;
  }

  @override
  set guest(bool value) {
    _$guestAtom.reportWrite(value, super.guest, () {
      super.guest = value;
    });
  }

  @override
  String toString() {
    return '''
guest: ${guest}
    ''';
  }
}
