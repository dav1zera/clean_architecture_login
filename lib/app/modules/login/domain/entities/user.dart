import 'package:equatable/equatable.dart';

class UserInfoData extends Equatable {
  final String uid;
  final String name;
  final String email;

  UserInfoData({required this.uid, required this.name, required this.email});

  @override
  List<Object?> get props => [uid, name, email];
}
