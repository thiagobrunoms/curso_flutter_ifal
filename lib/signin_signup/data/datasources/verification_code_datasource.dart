abstract class VerificationCodeDatasource<TReturn, TParam> {
  Future<TReturn> verifyCode({required TParam param});
}
