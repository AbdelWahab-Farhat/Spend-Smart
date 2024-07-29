
abstract class Failure{
 final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});
}

class LocalDatabaseFailure extends Failure {
  LocalDatabaseFailure({required super.errMessage});
}

class PDFFailure extends Failure {
  PDFFailure({required super.errMessage});

}