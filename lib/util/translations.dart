import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'id': '아이디',
          'password' : '비밀번호',
          'please_enter_your_email' : '이메일을 입력하세요',
          'please_enter_your_password' : '비밀번호를 입력하세요',

          'Invalid_email_format' : '잘못된 이메일 형식입니다.',
          'Invalid_password_format' : '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.',

          'sing_out' : '로그아웃'
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}