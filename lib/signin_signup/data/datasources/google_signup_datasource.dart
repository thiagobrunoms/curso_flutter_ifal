import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUpDatasource implements SignUpDatasource {
  late GoogleSignIn _googleSignIn;

  GoogleSignUpDatasource() {
    _googleSignIn = GoogleSignIn(scopes: ['email']);
  }

  @override
  Future<Either<Failure, UserModel>> signUp({SignUpEntity? entity}) async {
    GoogleSignInAccount? _account = await _googleSignIn.signIn();
    return right(UserModel(
      id: _account!.id,
      name: _account.displayName!,
      email: _account.email,
      photoURL: _account.photoUrl,
    ));
  }
}
