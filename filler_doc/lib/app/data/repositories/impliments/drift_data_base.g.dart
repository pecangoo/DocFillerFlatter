// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_data_base.dart';

// ignore_for_file: type=lint
class $TagTableTable extends TagTable with TableInfo<$TagTableTable, Tags> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameFieldMeta =
      const VerificationMeta('nameField');
  @override
  late final GeneratedColumn<String> nameField = GeneratedColumn<String>(
      'name_field', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagFieldMeta =
      const VerificationMeta('tagField');
  @override
  late final GeneratedColumn<String> tagField = GeneratedColumn<String>(
      'tag_field', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hintFieldMeta =
      const VerificationMeta('hintField');
  @override
  late final GeneratedColumn<String> hintField = GeneratedColumn<String>(
      'hint_field', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nameField, tagField, hintField];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_table';
  @override
  VerificationContext validateIntegrity(Insertable<Tags> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_field')) {
      context.handle(_nameFieldMeta,
          nameField.isAcceptableOrUnknown(data['name_field']!, _nameFieldMeta));
    } else if (isInserting) {
      context.missing(_nameFieldMeta);
    }
    if (data.containsKey('tag_field')) {
      context.handle(_tagFieldMeta,
          tagField.isAcceptableOrUnknown(data['tag_field']!, _tagFieldMeta));
    } else if (isInserting) {
      context.missing(_tagFieldMeta);
    }
    if (data.containsKey('hint_field')) {
      context.handle(_hintFieldMeta,
          hintField.isAcceptableOrUnknown(data['hint_field']!, _hintFieldMeta));
    } else if (isInserting) {
      context.missing(_hintFieldMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tags map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tags(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameField: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_field'])!,
      tagField: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_field'])!,
      hintField: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hint_field'])!,
    );
  }

  @override
  $TagTableTable createAlias(String alias) {
    return $TagTableTable(attachedDatabase, alias);
  }
}

class Tags extends DataClass implements Insertable<Tags> {
  final int id;
  final String nameField;
  final String tagField;
  final String hintField;
  const Tags(
      {required this.id,
      required this.nameField,
      required this.tagField,
      required this.hintField});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_field'] = Variable<String>(nameField);
    map['tag_field'] = Variable<String>(tagField);
    map['hint_field'] = Variable<String>(hintField);
    return map;
  }

  TagTableCompanion toCompanion(bool nullToAbsent) {
    return TagTableCompanion(
      id: Value(id),
      nameField: Value(nameField),
      tagField: Value(tagField),
      hintField: Value(hintField),
    );
  }

  factory Tags.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tags(
      id: serializer.fromJson<int>(json['id']),
      nameField: serializer.fromJson<String>(json['nameField']),
      tagField: serializer.fromJson<String>(json['tagField']),
      hintField: serializer.fromJson<String>(json['hintField']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameField': serializer.toJson<String>(nameField),
      'tagField': serializer.toJson<String>(tagField),
      'hintField': serializer.toJson<String>(hintField),
    };
  }

  Tags copyWith(
          {int? id, String? nameField, String? tagField, String? hintField}) =>
      Tags(
        id: id ?? this.id,
        nameField: nameField ?? this.nameField,
        tagField: tagField ?? this.tagField,
        hintField: hintField ?? this.hintField,
      );
  Tags copyWithCompanion(TagTableCompanion data) {
    return Tags(
      id: data.id.present ? data.id.value : this.id,
      nameField: data.nameField.present ? data.nameField.value : this.nameField,
      tagField: data.tagField.present ? data.tagField.value : this.tagField,
      hintField: data.hintField.present ? data.hintField.value : this.hintField,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tags(')
          ..write('id: $id, ')
          ..write('nameField: $nameField, ')
          ..write('tagField: $tagField, ')
          ..write('hintField: $hintField')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameField, tagField, hintField);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tags &&
          other.id == this.id &&
          other.nameField == this.nameField &&
          other.tagField == this.tagField &&
          other.hintField == this.hintField);
}

class TagTableCompanion extends UpdateCompanion<Tags> {
  final Value<int> id;
  final Value<String> nameField;
  final Value<String> tagField;
  final Value<String> hintField;
  const TagTableCompanion({
    this.id = const Value.absent(),
    this.nameField = const Value.absent(),
    this.tagField = const Value.absent(),
    this.hintField = const Value.absent(),
  });
  TagTableCompanion.insert({
    this.id = const Value.absent(),
    required String nameField,
    required String tagField,
    required String hintField,
  })  : nameField = Value(nameField),
        tagField = Value(tagField),
        hintField = Value(hintField);
  static Insertable<Tags> custom({
    Expression<int>? id,
    Expression<String>? nameField,
    Expression<String>? tagField,
    Expression<String>? hintField,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameField != null) 'name_field': nameField,
      if (tagField != null) 'tag_field': tagField,
      if (hintField != null) 'hint_field': hintField,
    });
  }

  TagTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameField,
      Value<String>? tagField,
      Value<String>? hintField}) {
    return TagTableCompanion(
      id: id ?? this.id,
      nameField: nameField ?? this.nameField,
      tagField: tagField ?? this.tagField,
      hintField: hintField ?? this.hintField,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameField.present) {
      map['name_field'] = Variable<String>(nameField.value);
    }
    if (tagField.present) {
      map['tag_field'] = Variable<String>(tagField.value);
    }
    if (hintField.present) {
      map['hint_field'] = Variable<String>(hintField.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableCompanion(')
          ..write('id: $id, ')
          ..write('nameField: $nameField, ')
          ..write('tagField: $tagField, ')
          ..write('hintField: $hintField')
          ..write(')'))
        .toString();
  }
}

class $FormTableTable extends FormTable with TableInfo<$FormTableTable, Forms> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameFormMeta =
      const VerificationMeta('nameForm');
  @override
  late final GeneratedColumn<String> nameForm = GeneratedColumn<String>(
      'name_form', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jsonListTagsMeta =
      const VerificationMeta('jsonListTags');
  @override
  late final GeneratedColumn<String> jsonListTags = GeneratedColumn<String>(
      'json_list_tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, nameForm, timestamp, jsonListTags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'form_table';
  @override
  VerificationContext validateIntegrity(Insertable<Forms> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name_form')) {
      context.handle(_nameFormMeta,
          nameForm.isAcceptableOrUnknown(data['name_form']!, _nameFormMeta));
    } else if (isInserting) {
      context.missing(_nameFormMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('json_list_tags')) {
      context.handle(
          _jsonListTagsMeta,
          jsonListTags.isAcceptableOrUnknown(
              data['json_list_tags']!, _jsonListTagsMeta));
    } else if (isInserting) {
      context.missing(_jsonListTagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Forms map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Forms(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      nameForm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_form'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
      jsonListTags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json_list_tags'])!,
    );
  }

  @override
  $FormTableTable createAlias(String alias) {
    return $FormTableTable(attachedDatabase, alias);
  }
}

class Forms extends DataClass implements Insertable<Forms> {
  final int id;
  final String uuid;
  final String nameForm;
  final int timestamp;
  final String jsonListTags;
  const Forms(
      {required this.id,
      required this.uuid,
      required this.nameForm,
      required this.timestamp,
      required this.jsonListTags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name_form'] = Variable<String>(nameForm);
    map['timestamp'] = Variable<int>(timestamp);
    map['json_list_tags'] = Variable<String>(jsonListTags);
    return map;
  }

  FormTableCompanion toCompanion(bool nullToAbsent) {
    return FormTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      nameForm: Value(nameForm),
      timestamp: Value(timestamp),
      jsonListTags: Value(jsonListTags),
    );
  }

  factory Forms.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Forms(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      nameForm: serializer.fromJson<String>(json['nameForm']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      jsonListTags: serializer.fromJson<String>(json['jsonListTags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'nameForm': serializer.toJson<String>(nameForm),
      'timestamp': serializer.toJson<int>(timestamp),
      'jsonListTags': serializer.toJson<String>(jsonListTags),
    };
  }

  Forms copyWith(
          {int? id,
          String? uuid,
          String? nameForm,
          int? timestamp,
          String? jsonListTags}) =>
      Forms(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        nameForm: nameForm ?? this.nameForm,
        timestamp: timestamp ?? this.timestamp,
        jsonListTags: jsonListTags ?? this.jsonListTags,
      );
  Forms copyWithCompanion(FormTableCompanion data) {
    return Forms(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      nameForm: data.nameForm.present ? data.nameForm.value : this.nameForm,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      jsonListTags: data.jsonListTags.present
          ? data.jsonListTags.value
          : this.jsonListTags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Forms(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('nameForm: $nameForm, ')
          ..write('timestamp: $timestamp, ')
          ..write('jsonListTags: $jsonListTags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, nameForm, timestamp, jsonListTags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Forms &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.nameForm == this.nameForm &&
          other.timestamp == this.timestamp &&
          other.jsonListTags == this.jsonListTags);
}

class FormTableCompanion extends UpdateCompanion<Forms> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> nameForm;
  final Value<int> timestamp;
  final Value<String> jsonListTags;
  const FormTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.nameForm = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.jsonListTags = const Value.absent(),
  });
  FormTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String nameForm,
    required int timestamp,
    required String jsonListTags,
  })  : uuid = Value(uuid),
        nameForm = Value(nameForm),
        timestamp = Value(timestamp),
        jsonListTags = Value(jsonListTags);
  static Insertable<Forms> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? nameForm,
    Expression<int>? timestamp,
    Expression<String>? jsonListTags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (nameForm != null) 'name_form': nameForm,
      if (timestamp != null) 'timestamp': timestamp,
      if (jsonListTags != null) 'json_list_tags': jsonListTags,
    });
  }

  FormTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? nameForm,
      Value<int>? timestamp,
      Value<String>? jsonListTags}) {
    return FormTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      nameForm: nameForm ?? this.nameForm,
      timestamp: timestamp ?? this.timestamp,
      jsonListTags: jsonListTags ?? this.jsonListTags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (nameForm.present) {
      map['name_form'] = Variable<String>(nameForm.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (jsonListTags.present) {
      map['json_list_tags'] = Variable<String>(jsonListTags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('nameForm: $nameForm, ')
          ..write('timestamp: $timestamp, ')
          ..write('jsonListTags: $jsonListTags')
          ..write(')'))
        .toString();
  }
}

class $TemplateTableTable extends TemplateTable
    with TableInfo<$TemplateTableTable, Templates> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameTemplateMeta =
      const VerificationMeta('nameTemplate');
  @override
  late final GeneratedColumn<String> nameTemplate = GeneratedColumn<String>(
      'name_template', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _uuidParentFormMeta =
      const VerificationMeta('uuidParentForm');
  @override
  late final GeneratedColumn<String> uuidParentForm = GeneratedColumn<String>(
      'uuid_parent_form', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jsonFieldsMeta =
      const VerificationMeta('jsonFields');
  @override
  late final GeneratedColumn<String> jsonFields = GeneratedColumn<String>(
      'json_fields', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, nameTemplate, timestamp, uuidParentForm, jsonFields];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_table';
  @override
  VerificationContext validateIntegrity(Insertable<Templates> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name_template')) {
      context.handle(
          _nameTemplateMeta,
          nameTemplate.isAcceptableOrUnknown(
              data['name_template']!, _nameTemplateMeta));
    } else if (isInserting) {
      context.missing(_nameTemplateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('uuid_parent_form')) {
      context.handle(
          _uuidParentFormMeta,
          uuidParentForm.isAcceptableOrUnknown(
              data['uuid_parent_form']!, _uuidParentFormMeta));
    } else if (isInserting) {
      context.missing(_uuidParentFormMeta);
    }
    if (data.containsKey('json_fields')) {
      context.handle(
          _jsonFieldsMeta,
          jsonFields.isAcceptableOrUnknown(
              data['json_fields']!, _jsonFieldsMeta));
    } else if (isInserting) {
      context.missing(_jsonFieldsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Templates map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Templates(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      nameTemplate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_template'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
      uuidParentForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}uuid_parent_form'])!,
      jsonFields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json_fields'])!,
    );
  }

  @override
  $TemplateTableTable createAlias(String alias) {
    return $TemplateTableTable(attachedDatabase, alias);
  }
}

class Templates extends DataClass implements Insertable<Templates> {
  final int id;
  final String uuid;
  final String nameTemplate;
  final int timestamp;
  final String uuidParentForm;
  final String jsonFields;
  const Templates(
      {required this.id,
      required this.uuid,
      required this.nameTemplate,
      required this.timestamp,
      required this.uuidParentForm,
      required this.jsonFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name_template'] = Variable<String>(nameTemplate);
    map['timestamp'] = Variable<int>(timestamp);
    map['uuid_parent_form'] = Variable<String>(uuidParentForm);
    map['json_fields'] = Variable<String>(jsonFields);
    return map;
  }

  TemplateTableCompanion toCompanion(bool nullToAbsent) {
    return TemplateTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      nameTemplate: Value(nameTemplate),
      timestamp: Value(timestamp),
      uuidParentForm: Value(uuidParentForm),
      jsonFields: Value(jsonFields),
    );
  }

  factory Templates.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Templates(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      nameTemplate: serializer.fromJson<String>(json['nameTemplate']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      uuidParentForm: serializer.fromJson<String>(json['uuidParentForm']),
      jsonFields: serializer.fromJson<String>(json['jsonFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'nameTemplate': serializer.toJson<String>(nameTemplate),
      'timestamp': serializer.toJson<int>(timestamp),
      'uuidParentForm': serializer.toJson<String>(uuidParentForm),
      'jsonFields': serializer.toJson<String>(jsonFields),
    };
  }

  Templates copyWith(
          {int? id,
          String? uuid,
          String? nameTemplate,
          int? timestamp,
          String? uuidParentForm,
          String? jsonFields}) =>
      Templates(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        nameTemplate: nameTemplate ?? this.nameTemplate,
        timestamp: timestamp ?? this.timestamp,
        uuidParentForm: uuidParentForm ?? this.uuidParentForm,
        jsonFields: jsonFields ?? this.jsonFields,
      );
  Templates copyWithCompanion(TemplateTableCompanion data) {
    return Templates(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      nameTemplate: data.nameTemplate.present
          ? data.nameTemplate.value
          : this.nameTemplate,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      uuidParentForm: data.uuidParentForm.present
          ? data.uuidParentForm.value
          : this.uuidParentForm,
      jsonFields:
          data.jsonFields.present ? data.jsonFields.value : this.jsonFields,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Templates(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('nameTemplate: $nameTemplate, ')
          ..write('timestamp: $timestamp, ')
          ..write('uuidParentForm: $uuidParentForm, ')
          ..write('jsonFields: $jsonFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, nameTemplate, timestamp, uuidParentForm, jsonFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Templates &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.nameTemplate == this.nameTemplate &&
          other.timestamp == this.timestamp &&
          other.uuidParentForm == this.uuidParentForm &&
          other.jsonFields == this.jsonFields);
}

class TemplateTableCompanion extends UpdateCompanion<Templates> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> nameTemplate;
  final Value<int> timestamp;
  final Value<String> uuidParentForm;
  final Value<String> jsonFields;
  const TemplateTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.nameTemplate = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.uuidParentForm = const Value.absent(),
    this.jsonFields = const Value.absent(),
  });
  TemplateTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String nameTemplate,
    required int timestamp,
    required String uuidParentForm,
    required String jsonFields,
  })  : uuid = Value(uuid),
        nameTemplate = Value(nameTemplate),
        timestamp = Value(timestamp),
        uuidParentForm = Value(uuidParentForm),
        jsonFields = Value(jsonFields);
  static Insertable<Templates> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? nameTemplate,
    Expression<int>? timestamp,
    Expression<String>? uuidParentForm,
    Expression<String>? jsonFields,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (nameTemplate != null) 'name_template': nameTemplate,
      if (timestamp != null) 'timestamp': timestamp,
      if (uuidParentForm != null) 'uuid_parent_form': uuidParentForm,
      if (jsonFields != null) 'json_fields': jsonFields,
    });
  }

  TemplateTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? nameTemplate,
      Value<int>? timestamp,
      Value<String>? uuidParentForm,
      Value<String>? jsonFields}) {
    return TemplateTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      nameTemplate: nameTemplate ?? this.nameTemplate,
      timestamp: timestamp ?? this.timestamp,
      uuidParentForm: uuidParentForm ?? this.uuidParentForm,
      jsonFields: jsonFields ?? this.jsonFields,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (nameTemplate.present) {
      map['name_template'] = Variable<String>(nameTemplate.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (uuidParentForm.present) {
      map['uuid_parent_form'] = Variable<String>(uuidParentForm.value);
    }
    if (jsonFields.present) {
      map['json_fields'] = Variable<String>(jsonFields.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('nameTemplate: $nameTemplate, ')
          ..write('timestamp: $timestamp, ')
          ..write('uuidParentForm: $uuidParentForm, ')
          ..write('jsonFields: $jsonFields')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftRepositoryDriftImpl extends GeneratedDatabase {
  _$DriftRepositoryDriftImpl(QueryExecutor e) : super(e);
  $DriftRepositoryDriftImplManager get managers =>
      $DriftRepositoryDriftImplManager(this);
  late final $TagTableTable tagTable = $TagTableTable(this);
  late final $FormTableTable formTable = $FormTableTable(this);
  late final $TemplateTableTable templateTable = $TemplateTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tagTable, formTable, templateTable];
}

typedef $$TagTableTableCreateCompanionBuilder = TagTableCompanion Function({
  Value<int> id,
  required String nameField,
  required String tagField,
  required String hintField,
});
typedef $$TagTableTableUpdateCompanionBuilder = TagTableCompanion Function({
  Value<int> id,
  Value<String> nameField,
  Value<String> tagField,
  Value<String> hintField,
});

class $$TagTableTableFilterComposer
    extends FilterComposer<_$DriftRepositoryDriftImpl, $TagTableTable> {
  $$TagTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameField => $state.composableBuilder(
      column: $state.table.nameField,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tagField => $state.composableBuilder(
      column: $state.table.tagField,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hintField => $state.composableBuilder(
      column: $state.table.hintField,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TagTableTableOrderingComposer
    extends OrderingComposer<_$DriftRepositoryDriftImpl, $TagTableTable> {
  $$TagTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameField => $state.composableBuilder(
      column: $state.table.nameField,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tagField => $state.composableBuilder(
      column: $state.table.tagField,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hintField => $state.composableBuilder(
      column: $state.table.hintField,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TagTableTableTableManager extends RootTableManager<
    _$DriftRepositoryDriftImpl,
    $TagTableTable,
    Tags,
    $$TagTableTableFilterComposer,
    $$TagTableTableOrderingComposer,
    $$TagTableTableCreateCompanionBuilder,
    $$TagTableTableUpdateCompanionBuilder,
    (Tags, BaseReferences<_$DriftRepositoryDriftImpl, $TagTableTable, Tags>),
    Tags,
    PrefetchHooks Function()> {
  $$TagTableTableTableManager(
      _$DriftRepositoryDriftImpl db, $TagTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nameField = const Value.absent(),
            Value<String> tagField = const Value.absent(),
            Value<String> hintField = const Value.absent(),
          }) =>
              TagTableCompanion(
            id: id,
            nameField: nameField,
            tagField: tagField,
            hintField: hintField,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nameField,
            required String tagField,
            required String hintField,
          }) =>
              TagTableCompanion.insert(
            id: id,
            nameField: nameField,
            tagField: tagField,
            hintField: hintField,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftRepositoryDriftImpl,
    $TagTableTable,
    Tags,
    $$TagTableTableFilterComposer,
    $$TagTableTableOrderingComposer,
    $$TagTableTableCreateCompanionBuilder,
    $$TagTableTableUpdateCompanionBuilder,
    (Tags, BaseReferences<_$DriftRepositoryDriftImpl, $TagTableTable, Tags>),
    Tags,
    PrefetchHooks Function()>;
typedef $$FormTableTableCreateCompanionBuilder = FormTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String nameForm,
  required int timestamp,
  required String jsonListTags,
});
typedef $$FormTableTableUpdateCompanionBuilder = FormTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> nameForm,
  Value<int> timestamp,
  Value<String> jsonListTags,
});

class $$FormTableTableFilterComposer
    extends FilterComposer<_$DriftRepositoryDriftImpl, $FormTableTable> {
  $$FormTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameForm => $state.composableBuilder(
      column: $state.table.nameForm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get jsonListTags => $state.composableBuilder(
      column: $state.table.jsonListTags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FormTableTableOrderingComposer
    extends OrderingComposer<_$DriftRepositoryDriftImpl, $FormTableTable> {
  $$FormTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameForm => $state.composableBuilder(
      column: $state.table.nameForm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get jsonListTags => $state.composableBuilder(
      column: $state.table.jsonListTags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FormTableTableTableManager extends RootTableManager<
    _$DriftRepositoryDriftImpl,
    $FormTableTable,
    Forms,
    $$FormTableTableFilterComposer,
    $$FormTableTableOrderingComposer,
    $$FormTableTableCreateCompanionBuilder,
    $$FormTableTableUpdateCompanionBuilder,
    (Forms, BaseReferences<_$DriftRepositoryDriftImpl, $FormTableTable, Forms>),
    Forms,
    PrefetchHooks Function()> {
  $$FormTableTableTableManager(
      _$DriftRepositoryDriftImpl db, $FormTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FormTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FormTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> nameForm = const Value.absent(),
            Value<int> timestamp = const Value.absent(),
            Value<String> jsonListTags = const Value.absent(),
          }) =>
              FormTableCompanion(
            id: id,
            uuid: uuid,
            nameForm: nameForm,
            timestamp: timestamp,
            jsonListTags: jsonListTags,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String nameForm,
            required int timestamp,
            required String jsonListTags,
          }) =>
              FormTableCompanion.insert(
            id: id,
            uuid: uuid,
            nameForm: nameForm,
            timestamp: timestamp,
            jsonListTags: jsonListTags,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FormTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftRepositoryDriftImpl,
    $FormTableTable,
    Forms,
    $$FormTableTableFilterComposer,
    $$FormTableTableOrderingComposer,
    $$FormTableTableCreateCompanionBuilder,
    $$FormTableTableUpdateCompanionBuilder,
    (Forms, BaseReferences<_$DriftRepositoryDriftImpl, $FormTableTable, Forms>),
    Forms,
    PrefetchHooks Function()>;
typedef $$TemplateTableTableCreateCompanionBuilder = TemplateTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String nameTemplate,
  required int timestamp,
  required String uuidParentForm,
  required String jsonFields,
});
typedef $$TemplateTableTableUpdateCompanionBuilder = TemplateTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> nameTemplate,
  Value<int> timestamp,
  Value<String> uuidParentForm,
  Value<String> jsonFields,
});

class $$TemplateTableTableFilterComposer
    extends FilterComposer<_$DriftRepositoryDriftImpl, $TemplateTableTable> {
  $$TemplateTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameTemplate => $state.composableBuilder(
      column: $state.table.nameTemplate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get uuidParentForm => $state.composableBuilder(
      column: $state.table.uuidParentForm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get jsonFields => $state.composableBuilder(
      column: $state.table.jsonFields,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TemplateTableTableOrderingComposer
    extends OrderingComposer<_$DriftRepositoryDriftImpl, $TemplateTableTable> {
  $$TemplateTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameTemplate => $state.composableBuilder(
      column: $state.table.nameTemplate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get uuidParentForm => $state.composableBuilder(
      column: $state.table.uuidParentForm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get jsonFields => $state.composableBuilder(
      column: $state.table.jsonFields,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TemplateTableTableTableManager extends RootTableManager<
    _$DriftRepositoryDriftImpl,
    $TemplateTableTable,
    Templates,
    $$TemplateTableTableFilterComposer,
    $$TemplateTableTableOrderingComposer,
    $$TemplateTableTableCreateCompanionBuilder,
    $$TemplateTableTableUpdateCompanionBuilder,
    (
      Templates,
      BaseReferences<_$DriftRepositoryDriftImpl, $TemplateTableTable, Templates>
    ),
    Templates,
    PrefetchHooks Function()> {
  $$TemplateTableTableTableManager(
      _$DriftRepositoryDriftImpl db, $TemplateTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TemplateTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TemplateTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> nameTemplate = const Value.absent(),
            Value<int> timestamp = const Value.absent(),
            Value<String> uuidParentForm = const Value.absent(),
            Value<String> jsonFields = const Value.absent(),
          }) =>
              TemplateTableCompanion(
            id: id,
            uuid: uuid,
            nameTemplate: nameTemplate,
            timestamp: timestamp,
            uuidParentForm: uuidParentForm,
            jsonFields: jsonFields,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String nameTemplate,
            required int timestamp,
            required String uuidParentForm,
            required String jsonFields,
          }) =>
              TemplateTableCompanion.insert(
            id: id,
            uuid: uuid,
            nameTemplate: nameTemplate,
            timestamp: timestamp,
            uuidParentForm: uuidParentForm,
            jsonFields: jsonFields,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TemplateTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftRepositoryDriftImpl,
    $TemplateTableTable,
    Templates,
    $$TemplateTableTableFilterComposer,
    $$TemplateTableTableOrderingComposer,
    $$TemplateTableTableCreateCompanionBuilder,
    $$TemplateTableTableUpdateCompanionBuilder,
    (
      Templates,
      BaseReferences<_$DriftRepositoryDriftImpl, $TemplateTableTable, Templates>
    ),
    Templates,
    PrefetchHooks Function()>;

class $DriftRepositoryDriftImplManager {
  final _$DriftRepositoryDriftImpl _db;
  $DriftRepositoryDriftImplManager(this._db);
  $$TagTableTableTableManager get tagTable =>
      $$TagTableTableTableManager(_db, _db.tagTable);
  $$FormTableTableTableManager get formTable =>
      $$FormTableTableTableManager(_db, _db.formTable);
  $$TemplateTableTableTableManager get templateTable =>
      $$TemplateTableTableTableManager(_db, _db.templateTable);
}
