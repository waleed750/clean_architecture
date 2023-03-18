import 'package:clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase <Type , Prams>{
  Future<Either<Failure , Type>>call(Prams prams) ;
}
class NoParams  extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class Param extends Equatable {
  String endpoint = "";

  Param({required this.endpoint});

  @override
  List<Object?> get props => [endpoint];

}