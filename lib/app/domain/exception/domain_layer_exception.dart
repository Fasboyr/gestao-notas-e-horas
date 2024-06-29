class DomainLayerException implements Exception {
  final String cause;

  DomainLayerException(this.cause);


  String toSring(){
    return cause;
  }
}