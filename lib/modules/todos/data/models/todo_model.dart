import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:todolist/infrastructure/config/color_config.dart';

class TodoModel with EquatableMixin {
  int? id;
  String? title;
  String? description;
  bool? isDone;
  String? type;

  TodoModel({
    this.id,
    this.title,
    this.description,
    this.isDone,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isDone,
        type,
      ];

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
    String? type,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'done': isDone,
      'type': type,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isDone: json['done'] as bool?,
      type: json['type'] as String?,
    );
  }

  Color get getColorTodoType {
    switch (type) {
      case 'normal':
        return ColorConfig.normalTypeColor;
      case 'meeting':
        return ColorConfig.meetingTypeColor;
      case 'study':
        return ColorConfig.studyTypeColor;
      default:
        return ColorConfig.whiteColor;
    }
  }
}
