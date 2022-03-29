// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Semester extends DataClass implements Insertable<Semester> {
  final int semesterId;
  final double semesterCGPA;
  Semester({required this.semesterId, required this.semesterCGPA});
  factory Semester.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Semester(
      semesterId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}SemesterId'])!,
      semesterCGPA: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}SemesterCGPA'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['SemesterId'] = Variable<int>(semesterId);
    map['SemesterCGPA'] = Variable<double>(semesterCGPA);
    return map;
  }

  SemestersCompanion toCompanion(bool nullToAbsent) {
    return SemestersCompanion(
      semesterId: Value(semesterId),
      semesterCGPA: Value(semesterCGPA),
    );
  }

  factory Semester.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Semester(
      semesterId: serializer.fromJson<int>(json['SemesterId']),
      semesterCGPA: serializer.fromJson<double>(json['SemesterCGPA']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'SemesterId': serializer.toJson<int>(semesterId),
      'SemesterCGPA': serializer.toJson<double>(semesterCGPA),
    };
  }

  Semester copyWith({int? semesterId, double? semesterCGPA}) => Semester(
        semesterId: semesterId ?? this.semesterId,
        semesterCGPA: semesterCGPA ?? this.semesterCGPA,
      );
  @override
  String toString() {
    return (StringBuffer('Semester(')
          ..write('semesterId: $semesterId, ')
          ..write('semesterCGPA: $semesterCGPA')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(semesterId, semesterCGPA);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Semester &&
          other.semesterId == this.semesterId &&
          other.semesterCGPA == this.semesterCGPA);
}

class SemestersCompanion extends UpdateCompanion<Semester> {
  final Value<int> semesterId;
  final Value<double> semesterCGPA;
  const SemestersCompanion({
    this.semesterId = const Value.absent(),
    this.semesterCGPA = const Value.absent(),
  });
  SemestersCompanion.insert({
    this.semesterId = const Value.absent(),
    this.semesterCGPA = const Value.absent(),
  });
  static Insertable<Semester> custom({
    Expression<int>? semesterId,
    Expression<double>? semesterCGPA,
  }) {
    return RawValuesInsertable({
      if (semesterId != null) 'SemesterId': semesterId,
      if (semesterCGPA != null) 'SemesterCGPA': semesterCGPA,
    });
  }

  SemestersCompanion copyWith(
      {Value<int>? semesterId, Value<double>? semesterCGPA}) {
    return SemestersCompanion(
      semesterId: semesterId ?? this.semesterId,
      semesterCGPA: semesterCGPA ?? this.semesterCGPA,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (semesterId.present) {
      map['SemesterId'] = Variable<int>(semesterId.value);
    }
    if (semesterCGPA.present) {
      map['SemesterCGPA'] = Variable<double>(semesterCGPA.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemestersCompanion(')
          ..write('semesterId: $semesterId, ')
          ..write('semesterCGPA: $semesterCGPA')
          ..write(')'))
        .toString();
  }
}

class Semesters extends Table with TableInfo<Semesters, Semester> {
  final GeneratedDatabase _db;
  final String? _alias;
  Semesters(this._db, [this._alias]);
  final VerificationMeta _semesterIdMeta = const VerificationMeta('semesterId');
  late final GeneratedColumn<int?> semesterId = GeneratedColumn<int?>(
      'SemesterId', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  final VerificationMeta _semesterCGPAMeta =
      const VerificationMeta('semesterCGPA');
  late final GeneratedColumn<double?> semesterCGPA = GeneratedColumn<double?>(
      'SemesterCGPA', aliasedName, false,
      type: const RealType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression<double>('0'));
  @override
  List<GeneratedColumn> get $columns => [semesterId, semesterCGPA];
  @override
  String get aliasedName => _alias ?? 'semesters';
  @override
  String get actualTableName => 'semesters';
  @override
  VerificationContext validateIntegrity(Insertable<Semester> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('SemesterId')) {
      context.handle(
          _semesterIdMeta,
          semesterId.isAcceptableOrUnknown(
              data['SemesterId']!, _semesterIdMeta));
    }
    if (data.containsKey('SemesterCGPA')) {
      context.handle(
          _semesterCGPAMeta,
          semesterCGPA.isAcceptableOrUnknown(
              data['SemesterCGPA']!, _semesterCGPAMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semesterId};
  @override
  Semester map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Semester.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Semesters createAlias(String alias) {
    return Semesters(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Course extends DataClass implements Insertable<Course> {
  final int courseId;
  final String? title;
  final int credits;
  final double courseGrade;
  final int semesterId;
  Course(
      {required this.courseId,
      this.title,
      required this.credits,
      required this.courseGrade,
      required this.semesterId});
  factory Course.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Course(
      courseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}CourseId'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Title']),
      credits: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Credits'])!,
      courseGrade: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}CourseGrade'])!,
      semesterId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}SemesterId'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CourseId'] = Variable<int>(courseId);
    if (!nullToAbsent || title != null) {
      map['Title'] = Variable<String?>(title);
    }
    map['Credits'] = Variable<int>(credits);
    map['CourseGrade'] = Variable<double>(courseGrade);
    map['SemesterId'] = Variable<int>(semesterId);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      courseId: Value(courseId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      credits: Value(credits),
      courseGrade: Value(courseGrade),
      semesterId: Value(semesterId),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Course(
      courseId: serializer.fromJson<int>(json['CourseId']),
      title: serializer.fromJson<String?>(json['Title']),
      credits: serializer.fromJson<int>(json['Credits']),
      courseGrade: serializer.fromJson<double>(json['CourseGrade']),
      semesterId: serializer.fromJson<int>(json['SemesterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'CourseId': serializer.toJson<int>(courseId),
      'Title': serializer.toJson<String?>(title),
      'Credits': serializer.toJson<int>(credits),
      'CourseGrade': serializer.toJson<double>(courseGrade),
      'SemesterId': serializer.toJson<int>(semesterId),
    };
  }

  Course copyWith(
          {int? courseId,
          String? title,
          int? credits,
          double? courseGrade,
          int? semesterId}) =>
      Course(
        courseId: courseId ?? this.courseId,
        title: title ?? this.title,
        credits: credits ?? this.credits,
        courseGrade: courseGrade ?? this.courseGrade,
        semesterId: semesterId ?? this.semesterId,
      );
  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('credits: $credits, ')
          ..write('courseGrade: $courseGrade, ')
          ..write('semesterId: $semesterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(courseId, title, credits, courseGrade, semesterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.courseId == this.courseId &&
          other.title == this.title &&
          other.credits == this.credits &&
          other.courseGrade == this.courseGrade &&
          other.semesterId == this.semesterId);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> courseId;
  final Value<String?> title;
  final Value<int> credits;
  final Value<double> courseGrade;
  final Value<int> semesterId;
  const CoursesCompanion({
    this.courseId = const Value.absent(),
    this.title = const Value.absent(),
    this.credits = const Value.absent(),
    this.courseGrade = const Value.absent(),
    this.semesterId = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.courseId = const Value.absent(),
    this.title = const Value.absent(),
    required int credits,
    required double courseGrade,
    required int semesterId,
  })  : credits = Value(credits),
        courseGrade = Value(courseGrade),
        semesterId = Value(semesterId);
  static Insertable<Course> custom({
    Expression<int>? courseId,
    Expression<String?>? title,
    Expression<int>? credits,
    Expression<double>? courseGrade,
    Expression<int>? semesterId,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'CourseId': courseId,
      if (title != null) 'Title': title,
      if (credits != null) 'Credits': credits,
      if (courseGrade != null) 'CourseGrade': courseGrade,
      if (semesterId != null) 'SemesterId': semesterId,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? courseId,
      Value<String?>? title,
      Value<int>? credits,
      Value<double>? courseGrade,
      Value<int>? semesterId}) {
    return CoursesCompanion(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      credits: credits ?? this.credits,
      courseGrade: courseGrade ?? this.courseGrade,
      semesterId: semesterId ?? this.semesterId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['CourseId'] = Variable<int>(courseId.value);
    }
    if (title.present) {
      map['Title'] = Variable<String?>(title.value);
    }
    if (credits.present) {
      map['Credits'] = Variable<int>(credits.value);
    }
    if (courseGrade.present) {
      map['CourseGrade'] = Variable<double>(courseGrade.value);
    }
    if (semesterId.present) {
      map['SemesterId'] = Variable<int>(semesterId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('credits: $credits, ')
          ..write('courseGrade: $courseGrade, ')
          ..write('semesterId: $semesterId')
          ..write(')'))
        .toString();
  }
}

class Courses extends Table with TableInfo<Courses, Course> {
  final GeneratedDatabase _db;
  final String? _alias;
  Courses(this._db, [this._alias]);
  final VerificationMeta _courseIdMeta = const VerificationMeta('courseId');
  late final GeneratedColumn<int?> courseId = GeneratedColumn<int?>(
      'CourseId', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'Title', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _creditsMeta = const VerificationMeta('credits');
  late final GeneratedColumn<int?> credits = GeneratedColumn<int?>(
      'Credits', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _courseGradeMeta =
      const VerificationMeta('courseGrade');
  late final GeneratedColumn<double?> courseGrade = GeneratedColumn<double?>(
      'CourseGrade', aliasedName, false,
      type: const RealType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _semesterIdMeta = const VerificationMeta('semesterId');
  late final GeneratedColumn<int?> semesterId = GeneratedColumn<int?>(
      'SemesterId', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, title, credits, courseGrade, semesterId];
  @override
  String get aliasedName => _alias ?? 'courses';
  @override
  String get actualTableName => 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CourseId')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['CourseId']!, _courseIdMeta));
    }
    if (data.containsKey('Title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['Title']!, _titleMeta));
    }
    if (data.containsKey('Credits')) {
      context.handle(_creditsMeta,
          credits.isAcceptableOrUnknown(data['Credits']!, _creditsMeta));
    } else if (isInserting) {
      context.missing(_creditsMeta);
    }
    if (data.containsKey('CourseGrade')) {
      context.handle(
          _courseGradeMeta,
          courseGrade.isAcceptableOrUnknown(
              data['CourseGrade']!, _courseGradeMeta));
    } else if (isInserting) {
      context.missing(_courseGradeMeta);
    }
    if (data.containsKey('SemesterId')) {
      context.handle(
          _semesterIdMeta,
          semesterId.isAcceptableOrUnknown(
              data['SemesterId']!, _semesterIdMeta));
    } else if (isInserting) {
      context.missing(_semesterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Course.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Courses createAlias(String alias) {
    return Courses(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY ([SemesterId]) REFERENCES "semesters" ([SemesterId]) ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Semesters semesters = Semesters(this);
  late final Courses courses = Courses(this);
  Selectable<Course> getSemesterCourses(int var1) {
    return customSelect('SELECT * FROM courses WHERE SemesterId = ?',
        variables: [
          Variable<int>(var1)
        ],
        readsFrom: {
          courses,
        }).map(courses.mapFromRow);
  }

  Selectable<int> getSemesterCoursesLength(int var1) {
    return customSelect('SELECT COUNT(*) FROM courses WHERE SemesterId = ?',
        variables: [
          Variable<int>(var1)
        ],
        readsFrom: {
          courses,
        }).map((QueryRow row) => row.read<int>('COUNT(*)'));
  }

  Selectable<int> getSemesterLength() {
    return customSelect('SELECT COUNT(*) FROM semesters',
        variables: [],
        readsFrom: {
          semesters,
        }).map((QueryRow row) => row.read<int>('COUNT(*)'));
  }

  Selectable<int> getCoursesLength() {
    return customSelect('SELECT COUNT(*) FROM courses',
        variables: [],
        readsFrom: {
          courses,
        }).map((QueryRow row) => row.read<int>('COUNT(*)'));
  }

  Selectable<double> getSemesterCgpa(int var1) {
    return customSelect(
        'SELECT sum(CourseGrade * Credits) / sum(Credits) from courses WHERE SemesterId = ?',
        variables: [
          Variable<int>(var1)
        ],
        readsFrom: {
          courses,
        }).map((QueryRow row) =>
        row.read<double>('sum(CourseGrade * Credits) / sum(Credits)'));
  }

  Selectable<double> getOverallCgpa() {
    return customSelect(
        'SELECT avg(SemesterCGPA) FROM semesters WHERE (SemesterCGPA != 0)',
        variables: [],
        readsFrom: {
          semesters,
        }).map((QueryRow row) => row.read<double>('avg(SemesterCGPA)'));
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [semesters, courses];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('semesters',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('courses', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
