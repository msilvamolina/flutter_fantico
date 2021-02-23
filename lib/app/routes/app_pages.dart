import 'package:get/route_manager.dart';

import '../pages/auth/email_verification/email_verification_binding.dart';
import '../pages/auth/email_verification/email_verification_page.dart';
import '../pages/auth/forgot_password/forgot_binding.dart';
import '../pages/auth/forgot_password/forgot_password_new_page.dart';
import '../pages/auth/login/login_binding.dart';
import '../pages/auth/login/login_page.dart';
import '../pages/auth/signup/signup_binding.dart';
import '../pages/auth/signup/signup_page.dart';
import '../pages/fixture_chat/fixture_chat_binding.dart';
import '../pages/fixture_chat/fixture_chat_page.dart';
import '../pages/fixture_details/fixture_details_binding.dart';
import '../pages/fixture_details/fixture_details_page.dart';
import '../pages/home/home_binding.dart';
import '../pages/home/home_page.dart';
import '../pages/info/info_binding.dart';
import '../pages/info/info_page.dart';
import '../pages/profile/choose_team/choose_team_binding.dart';
import '../pages/profile/choose_team/choose_team_page.dart';
import '../pages/profile/user_profile/user_profile_binding.dart';
import '../pages/profile/user_profile/user_profile_page.dart';
import '../pages/profile/username/username_binding.dart';
import '../pages/profile/username/username_page.dart';
import '../pages/ranking_details/ranking_details_binding.dart';
import '../pages/ranking_details/ranking_details_page.dart';
import '../pages/user_public_profile/user_public_profile_binding.dart';
import '../pages/user_public_profile/user_public_profile_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.USERNAME,
      page: () => UsernamePage(),
      binding: UsernameBinding(),
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD_NEW,
      page: () => ForgotPasswordNewPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.EMAIL_VERIFICATION,
      page: () => EmailVerificationPage(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.USER_PROFILE,
      page: () => UserProfilePage(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.CHOOSE_TEAM,
      page: () => ChooseTeamPage(),
      binding: ChooseTeamBinding(),
    ),
    GetPage(
      name: AppRoutes.INFO,
      page: () => InfoPage(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: AppRoutes.FIXTURE_DETAILS,
      page: () => FixtureDetailsPage(),
      binding: FixtureDetailsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.FIXTURE_CHAT,
      page: () => FixtureChatPage(),
      binding: FixtureChatBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.RANKING_DETAILS,
      page: () => RankingDetailsPage(),
      binding: RankingDetailsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.USER_PUBLIC_PROFILE,
      page: () => UserPublicProfilePage(),
      binding: UserPublicProfileBinding(),
    ),
  ];
}
