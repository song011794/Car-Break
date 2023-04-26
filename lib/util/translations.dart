import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'app_title': 'Car휴',
          'id': '아이디',
          'password': '비밀번호',
          'password_confirm': '비밀번호 확인',
          'please_enter_your_email': '이메일을 입력하세요',
          'please_enter_your_password': '비밀번호를 입력하세요',
          'Invalid_email_format': '잘못된 이메일 형식입니다.',
          'Invalid_password_format': '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.',
          'Invalid_password_confirm_format': '비밀번호가 일치하지 않습니다.',
          'sing_out': '로그아웃',
          'sign_in': '로그인',
          'sign_up': '회원가입',
          'sns_login': 'SNS 계정으로 로그인',
          'view_passwod': '비밀번호 보기',
          'mail_authentication': '메일 인증',
          'find_password': '비밀번호 찾기',
          'next': '다음',
          'before': '이전',
          'sign_up_failed': '회원가입 실패',
          'This_email_is_already_registered': '이미 등록되어 있는 이메일입니다',
          'send_verification_mail': '인증 메일 보내기',
          'send_verification_mail_infomation':
              "'인증 메일 보내기' 버튼을 클릭해주세요.\n받은 메일의 링크를 클릭하여 가입 완료해주세요.",
          'ok': '확인',
          'verification_email_has_been_sent': '인증 메일을 보냈습니다. \n메일을 확인해주세요.',
          'permission_request': '권한 요청',
          'Please_allow_location_permission' : '위치 권한을 허용해주세요',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
