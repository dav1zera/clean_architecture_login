import 'package:clean_login/app/commons/infra/models/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/external/datasource/firebase_datasource_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FireBaseUserMock extends Mock implements User {}

class AuthResultMock extends Mock implements UserCredential {}

class AuthCredentialMock extends Mock implements AuthCredential {}

class OAuthCredentialMock extends Mock implements OAuthCredential {}

class AuthExceptionMock extends Mock implements FirebaseAuthException {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

final credential = AuthCredentialMock();
final authException = AuthExceptionMock();
final oAuthCredential = OAuthCredentialMock();

main() {
  final auth = FirebaseAuthMock();

  final fireBaseUser = FireBaseUserMock();
  final user = UserModel(
    uid: "123456",
    name: "davi teste",
    email: "teste@mail.com",
  );
  final credentials = Credentials(
    email: "teste@mail.com",
    password: "372130D4v1;",
  );

  final loginUser = AuthResultMock();
  final sut = FireBaseDataSourceLoginImpl(auth);

  setUpAll(
    () {
      when(() => fireBaseUser.uid).thenReturn("123456");
      when(() => fireBaseUser.displayName).thenReturn("davi teste");
      when(() => fireBaseUser.email).thenReturn("teste@mail.com");
      when(() => loginUser.user).thenReturn(fireBaseUser);

      when(
        () => auth.signInWithEmailAndPassword(
          email: any(
            named: "email",
          ),
          password: any(
            named: "password",
          ),
        ),
      ).thenAnswer(
        (_) async => loginUser,
      );
      when(() => auth.signInWithCredential(oAuthCredential))
          .thenAnswer((_) async => loginUser);
    },
  );

  group(
    "Login com email e senha",
    () {
      test(
        "Testando fluxo de login com email e senha",
        () async {
          final result = await sut.executeLoginEmail(credentials: credentials);
          expect(result, isA<UserModel>());
          expect(result.uid, equals(user.uid));
          expect(result.name, equals(user.name));
          expect(result.email, equals(user.email));
        },
      );

      test(
        "fluxo de erro",
        () async {
          when(() => loginUser.user).thenReturn(null);
          final result = sut.executeLoginEmail(credentials: credentials);
          expect(
            result,
            throwsA(
              isA<ErrorLoginEmail>(),
            ),
          );
        },
      );
    },
  );

  group(
    "Fluxo de current user",
    () {
      test(
        "testando fluxo current user",
        () async {
          when(() => auth.currentUser).thenAnswer((_) => fireBaseUser);
          final result = await sut.currentUser();
          expect(result, isA<UserModel>());
          expect(result.uid, equals(user.uid));
          expect(result.name, equals(user.name));
          expect(result.email, equals(user.email));
        },
      );

      test(
        "Fluxo de erro",
        () async {
          when(() => auth.currentUser).thenReturn(null);
          final result = sut.currentUser();
          expect(
            result,
            throwsA(
              isA<ErrorGetLoggedUser>(),
            ),
          );
        },
      );
    },
  );

  group(
    "fluxo de logout",
    () {
      test(
        "Testando fluxo de logout",
        () {
          when(() => auth.signOut()).thenAnswer((_) async => {});
          expect(sut.logout(), completes);
        },
      );
    },
  );

  test(
    "testando fluxo de erro",
    () async {
      when(() => auth.signOut()).thenThrow(Exception());
      expect(
        sut.logout(),
        throwsA(
          isA<Exception>(),
        ),
      );
    },
  );
}
