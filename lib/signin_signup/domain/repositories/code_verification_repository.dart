abstract class VerificationCodeRepository<TReturn, TParam> {
  Future<TReturn> verifyCode({required TParam param});
}
