//Languages
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final String? name;
  final String? code;
  final String? country;
  final int? color;

  const LanguageModel({this.name, this.code, this.country, this.color});

  factory LanguageModel.fromMap(Map<String, dynamic> data) => LanguageModel(
        name: data['name'] as String?,
        code: data['code'] as String?,
        country: data['country'] as String?,
        color: data['color'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'code': code,
        'country': country,
        'color': color,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LanguageModel].
  factory LanguageModel.fromJson(String data) {
    return LanguageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LanguageModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LanguageModel copyWith({
    String? name,
    String? code,
    String? country,
    int? color,
  }) {
    return LanguageModel(
      name: name ?? this.name,
      code: code ?? this.code,
      country: country ?? this.country,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [name, code, country, color];
}
