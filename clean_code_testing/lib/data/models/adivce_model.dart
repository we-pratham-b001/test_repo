import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int id})
    : super(advice: advice, id: id);

  factory AdviceModel.formJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['advice'], id: json['advice_id']);
  }
  @override
  List<Object?> get props => [advice, id];
}
