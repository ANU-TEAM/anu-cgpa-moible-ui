// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Semester extends DataClass implements Insertable<Semester> {
  final int semesterId;
  final double semesterCGPA;
  Semester({@required this.semesterId, @required this.semesterCGPA});
  factory Semester.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Semester(
      semesterId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}SemesterId']),
      semesterCGPA: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}SemesterCGPA']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || semesterId != null) {
      map['SemesterId'] = Variable<int>(semesterId);
    }
    if (!nullToAbsent || semesterCGPA != null) {
      map['SemesterCGPA'] = Variable<double>(semesterCGPA);
    }
    return map;
  }

  SemestersCompanion toCompanion(bool nullToAbsent) {
    return SemestersCompanion(
      semesterId: semesterId == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterId),
      semesterCGPA: semesterCGPA == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterCGPA),
    );
  }

  factory Semester.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Semester(
      semesterId: serializer.fromJson<int>(json['SemesterId']),
      semesterCGPA: serializer.fromJson<double>(json['SemesterCGPA']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'SemesterId': serializer.toJson<int>(semesterId),
      'SemesterCGPA': serializer.toJson<double>(semesterCGPA),
    };
  }

  Semester copyWith({int semesterId, double semesterCGPA}) => Semester(
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
  int get hashCode => $mrjf($mrjc(semesterId.hashCode, semesterCGPA.hashCode));
  @override
  bool operator ==(dynamic other) =>
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
    Expression<int> semesterId,
    Expression<double> semesterCGPA,
  }) {
    return RawValuesInsertable({
      if (semesterId != null) 'SemesterId': semesterId,
      if (semesterCGPA != null) 'SemesterCGPA': semesterCGPA,
    });
  }

  SemestersCompanion copyWith(
      {Value<int> semesterId, Value<double> semesterCGPA}) {
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
  final String _alias;
  Semesters(this._db, [this._alias]);
  final VerificationMeta _semesterIdMeta = const VerificationMeta('semesterId');
  GeneratedIntColumn _semesterId;
  GeneratedIntColumn get semesterId => _semesterId ??= _constructSemesterId();
  GeneratedIntColumn _constructSemesterId() {
    return GeneratedIntColumn('SemesterId', $tableName, false,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  }

  final VerificationMeta _semesterCGPAMeta =
      const VerificationMeta('semesterCGPA');
  GeneratedRealColumn _semesterCGPA;
  GeneratedRealColumn get semesterCGPA =>
      _semesterCGPA ??= _constructSemesterCGPA();
  GeneratedRealColumn _constructSemesterCGPA() {
    return GeneratedRealColumn('SemesterCGPA', $tableName, false,
        $customConstraints: 'NOT NULL DEFAULT 0',
        defaultValue: const CustomExpression<double>('0'));
  }

  @override
  List<GeneratedColumn> get $columns => [semesterId, semesterCGPA];
  @override
  Semesters get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'semesters';
  @override
  final String actualTableName = 'semesters';
  @override
  VerificationContext validateIntegrity(Insertable<Semester> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('SemesterId')) {
      context.handle(
          _semesterIdMeta,
          semesterId.isAcceptableOrUnknown(
              data['SemesterId'], _semesterIdMeta));
    }
    if (data.containsKey('SemesterCGPA')) {
      context.handle(
          _semesterCGPAMeta,
          semesterCGPA.isAcceptableOrUnknown(
              data['SemesterCGPA'], _semesterCGPAMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semesterId};
  @override
  Semester map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Semester.fromData(data, _db, prefix: effectivePrefix);
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
  final String title;
  final String code;
  final int credits;
  final double courseGrade;
  final int semesterId;
  Course(
      {@required this.courseId,
      @required this.title,
      @required this.code,
      @required this.credits,
      @required this.courseGrade,
      @required this.semesterId});
  factory Course.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Course(
      courseId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}CourseId']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}Title']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}Code']),
      credits:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}Credits']),
      courseGrade: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}CourseGrade']),
      semesterId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}SemesterId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || courseId != null) {
      map['CourseId'] = Variable<int>(courseId);
    }
    if (!nullToAbsent || title != null) {
      map['Title'] = Variable<String>(title);
    }
    if (!nullToAbsent || code != null) {
      map['Code'] = Variable<String>(code);
    }
    if (!nullToAbsent || credits != null) {
      map['Credits'] = Variable<int>(credits);
    }
    if (!nullToAbsent || courseGrade != null) {
      map['CourseGrade'] = Variable<double>(courseGrade);
    }
    if (!nullToAbsent || semesterId != null) {
      map['SemesterId'] = Variable<int>(semesterId);
    }
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      courseId: courseId == null && nullToAbsent
          ? const Value.absent()
          : Value(courseId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      credits: credits == null && nullToAbsent
          ? const Value.absent()
          : Value(credits),
      courseGrade: courseGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(courseGrade),
      semesterId: semesterId == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterId),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Course(
      courseId: serializer.fromJson<int>(json['CourseId']),
      title: serializer.fromJson<String>(json['Title']),
      code: serializer.fromJson<String>(json['Code']),
      credits: serializer.fromJson<int>(json['Credits']),
      courseGrade: serializer.fromJson<double>(json['CourseGrade']),
      semesterId: serializer.fromJson<int>(json['SemesterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'CourseId': serializer.toJson<int>(courseId),
      'Title': serializer.toJson<String>(title),
      'Code': serializer.toJson<String>(code),
      'Credits': serializer.toJson<int>(credits),
      'CourseGrade': serializer.toJson<double>(courseGrade),
      'SemesterId': serializer.toJson<int>(semesterId),
    };
  }

  Course copyWith(
          {int courseId,
          String title,
          String code,
          int credits,
          double courseGrade,
          int semesterId}) =>
      Course(
        courseId: courseId ?? this.courseId,
        title: title ?? this.title,
        code: code ?? this.code,
        credits: credits ?? this.credits,
        courseGrade: courseGrade ?? this.courseGrade,
        semesterId: semesterId ?? this.semesterId,
      );
  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('credits: $credits, ')
          ..write('courseGrade: $courseGrade, ')
          ..write('semesterId: $semesterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      courseId.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(credits.hashCode,
                  $mrjc(courseGrade.hashCode, semesterId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Course &&
          other.courseId == this.courseId &&
          other.title == this.title &&
          other.code == this.code &&
          other.credits == this.credits &&
          other.courseGrade == this.courseGrade &&
          other.semesterId == this.semesterId);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> courseId;
  final Value<String> title;
  final Value<String> code;
  final Value<int> credits;
  final Value<double> courseGrade;
  final Value<int> semesterId;
  const CoursesCompanion({
    this.courseId = const Value.absent(),
    this.title = const Value.absent(),
    this.code = const Value.absent(),
    this.credits = const Value.absent(),
    this.courseGrade = const Value.absent(),
    this.semesterId = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.courseId = const Value.absent(),
    @required String title,
    @required String code,
    @required int credits,
    @required double courseGrade,
    @required int semesterId,
  })  : title = Value(title),
        code = Value(code),
        credits = Value(credits),
        courseGrade = Value(courseGrade),
        semesterId = Value(semesterId);
  static Insertable<Course> custom({
    Expression<int> courseId,
    Expression<String> title,
    Expression<String> code,
    Expression<int> credits,
    Expression<double> courseGrade,
    Expression<int> semesterId,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'CourseId': courseId,
      if (title != null) 'Title': title,
      if (code != null) 'Code': code,
      if (credits != null) 'Credits': credits,
      if (courseGrade != null) 'CourseGrade': courseGrade,
      if (semesterId != null) 'SemesterId': semesterId,
    });
  }

  CoursesCompanion copyWith(
      {Value<int> courseId,
      Value<String> title,
      Value<String> code,
      Value<int> credits,
      Value<double> courseGrade,
      Value<int> semesterId}) {
    return CoursesCompanion(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      code: code ?? this.code,
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
      map['Title'] = Variable<String>(title.value);
    }
    if (code.present) {
      map['Code'] = Variable<String>(code.value);
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
          ..write('code: $code, ')
          ..write('credits: $credits, ')
          ..write('courseGrade: $courseGrade, ')
          ..write('semesterId: $semesterId')
          ..write(')'))
        .toString();
  }
}

class Courses extends Table with TableInfo<Courses, Course> {
  final GeneratedDatabase _db;
  final String _alias;
  Courses(this._db, [this._alias]);
  final VerificationMeta _courseIdMeta = const VerificationMeta('courseId');
  GeneratedIntColumn _courseId;
  GeneratedIntColumn get courseId => _courseId ??= _constructCourseId();
  GeneratedIntColumn _constructCourseId() {
    return GeneratedIntColumn('CourseId', $tableName, false,
        declaredAsPrimaryKey: true, $customConstraints: 'PRIMARY KEY NOT NULL');
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('Title', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('Code', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _creditsMeta = const VerificationMeta('credits');
  GeneratedIntColumn _credits;
  GeneratedIntColumn get credits => _credits ??= _constructCredits();
  GeneratedIntColumn _constructCredits() {
    return GeneratedIntColumn('Credits', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _courseGradeMeta =
      const VerificationMeta('courseGrade');
  GeneratedRealColumn _courseGrade;
  GeneratedRealColumn get courseGrade =>
      _courseGrade ??= _constructCourseGrade();
  GeneratedRealColumn _constructCourseGrade() {
    return GeneratedRealColumn('CourseGrade', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _semesterIdMeta = const VerificationMeta('semesterId');
  GeneratedIntColumn _semesterId;
  GeneratedIntColumn get semesterId => _semesterId ??= _constructSemesterId();
  GeneratedIntColumn _constructSemesterId() {
    return GeneratedIntColumn('SemesterId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [courseId, title, code, credits, courseGrade, semesterId];
  @override
  Courses get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'courses';
  @override
  final String actualTableName = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CourseId')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['CourseId'], _courseIdMeta));
    }
    if (data.containsKey('Title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['Title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('Code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['Code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('Credits')) {
      context.handle(_creditsMeta,
          credits.isAcceptableOrUnknown(data['Credits'], _creditsMeta));
    } else if (isInserting) {
      context.missing(_creditsMeta);
    }
    if (data.containsKey('CourseGrade')) {
      context.handle(
          _courseGradeMeta,
          courseGrade.isAcceptableOrUnknown(
              data['CourseGrade'], _courseGradeMeta));
    } else if (isInserting) {
      context.missing(_courseGradeMeta);
    }
    if (data.containsKey('SemesterId')) {
      context.handle(
          _semesterIdMeta,
          semesterId.isAcceptableOrUnknown(
              data['SemesterId'], _semesterIdMeta));
    } else if (isInserting) {
      context.missing(_semesterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  Course map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Course.fromData(data, _db, prefix: effectivePrefix);
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
  Semesters _semesters;
  Semesters get semesters => _semesters ??= Semesters(this);
  Courses _courses;
  Courses get courses => _courses ??= Courses(this);
  Selectable<Course> getSemesterCourses(int var1) {
    return customSelect('SELECT * FROM courses WHERE SemesterId = ?',
        variables: [Variable.withInt(var1)],
        readsFrom: {courses}).map(courses.mapFromRow);
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
