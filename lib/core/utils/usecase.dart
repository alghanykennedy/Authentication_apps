abstract class UseCase<ReturnType, ParamsType> {
  Future<ReturnType> call(ParamsType params);
}
