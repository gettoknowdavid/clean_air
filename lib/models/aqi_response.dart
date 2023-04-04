import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  genericArgumentFactories: true,
)
class AqiResponse<T> extends Equatable {
  final String? status;
  final T? data;
  final String? message;

  const AqiResponse({this.status, this.data, this.message});

  factory AqiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AqiResponseFromJson<T>(json, fromJsonT);

  @override
  List<Object?> get props => [status, data, message];

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$AqiResponseToJson<T>(this, toJsonT);
}
