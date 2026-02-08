import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:live_health/app_psychic/auth_screen/forgot_password/screens/forgot_gmail_views.dart';
import 'package:live_health/app_psychic/auth_screen/forgot_password/screens/forgot_new_password_views.dart';
import 'package:live_health/app_psychic/auth_screen/forgot_password/screens/forgot_otp_gmail_views.dart';
import 'package:live_health/app_psychic/auth_screen/login_screens/screens/login_screen_views.dart';
import 'package:live_health/app_psychic/auth_screen/otp_screen/screens/otp_screen_views.dart';
import 'package:live_health/app_psychic/auth_screen/signup_screen/screens/sign_up_screen_views.dart';
import 'package:live_health/app_psychic/modules/earning_views/views/earning_view_views.dart';
import 'package:live_health/app_psychic/modules/my_account_views/views/account_views.dart';
import 'package:live_health/app_psychic/modules/my_live_views/views/my_live_views.dart';
import 'package:live_health/app_psychic/modules/my_profile_views/views/my_profile_views.dart';
import 'package:live_health/app_psychic/modules/navigation_bar_views/screens/main_bottom_bar_screen_views.dart';
import 'package:live_health/app_psychic/modules/onboarding_screen_views/screens/onboarding_screen_viewss.dart';
import 'package:live_health/app_psychic/modules/pay_out_history_views/vieews/pay_out_history_views.dart';
import 'package:live_health/app_psychic/modules/privacy_policy_views/views/privacy_policy_views.dart';
import 'package:live_health/app_psychic/modules/profile_setup_screen_views/screens/profile_setup_screen_views.dart';
import 'package:live_health/app_psychic/modules/recent_all_story_views/views/recent_history_all_view_views.dart';
import 'package:live_health/app_psychic/modules/review_rattings_views/views/review_ratting_views.dart';
import 'package:live_health/app_psychic/modules/session_history_views/views/session_history_views.dart';
import 'package:live_health/app_psychic/modules/story_day_views/views/story_day_views.dart';
import 'package:live_health/app_psychic/modules/terms_of_services_views/views/terms_of_services_views.dart';
import 'package:live_health/app_psychic/modules/view_all_screen/views/view_all_screen.dart';
import 'package:live_health/app_user/auth_screen/forgot_password/screens/forgot_gmail.dart';
import 'package:live_health/app_user/auth_screen/forgot_password/screens/forgot_new_password.dart';
import 'package:live_health/app_user/auth_screen/forgot_password/screens/forgot_otp_gmail.dart';
import 'package:live_health/app_user/auth_screen/login_screens/screens/login_screen.dart';
import 'package:live_health/app_user/auth_screen/otp_screen/screens/otp_screen.dart';
import 'package:live_health/app_user/auth_screen/signup_screen/screens/sign_up_screen.dart';
import 'package:live_health/app_user/modules/all_product_screen/views/all_product_screen.dart';
import 'package:live_health/app_user/modules/help_support/views/help_support_view.dart';
import 'package:live_health/app_user/modules/home_screen/screens/my_home_page.dart';
import 'package:live_health/app_user/modules/live_strem_screen/views/live_stream_screen.dart';
import 'package:live_health/app_user/modules/my_orders/views/my_order_view.dart';
import 'package:live_health/app_user/modules/my_profile/views/my_profile_view.dart';
import 'package:live_health/app_user/modules/my_sessions/sessions_screen/screens/sessions.dart';
import 'package:live_health/app_user/modules/onboarding_screen/views/onboarding_screen.dart';
import 'package:live_health/app_user/modules/onboarding_screen/views/onboarding_screen_view.dart';
import 'package:live_health/app_user/modules/order_summary_screen/views/add_cart_summary.dart';
import 'package:live_health/app_user/modules/order_summary_screen/views/order_summary_view.dart';
import 'package:live_health/app_user/modules/product_details_screen/views/product_details_view.dart';
import 'package:live_health/app_user/modules/profile_setup_screen/screens/profile_setup_screen.dart';
import 'package:live_health/app_user/modules/psychics_details_screen/views/psychics_details_view.dart';
import 'package:live_health/app_user/modules/review_rattings/views/review_ratting_view.dart';
import 'package:live_health/app_user/modules/session_history/views/session_history.dart';
import 'package:live_health/app_user/modules/transaction_history/views/transaction_history_view.dart';
import 'package:live_health/role_change_screen/screens/role_change_view.dart';
import 'package:live_health/routes/app_routes.dart';

class AppPages {
  static final pages = [
    /// ..........................App User Screens.................
    GetPage(name: AppRoutes.myHomePage, page: ()=> MyHomePage()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.onboardingScreenView, page: () => OnboardingScreenView()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.otpScreen, page: () => OtpScreen()),
    GetPage(name: AppRoutes.profileSetupScreen, page: ()=> ProfileSetupScreen()),
    GetPage(name: AppRoutes.forgotGmail, page: ()=> ForgotGmail()),
    GetPage(name: AppRoutes.forgotOtpGmail, page: ()=> ForgotOtpGmail()),
    GetPage(name: AppRoutes.forgotNewPassword, page: ()=> ForgotNewPassword()),
    GetPage(name: AppRoutes.sessions, page: ()=> Sessions()),
    GetPage(name: AppRoutes.myProfileView, page: ()=> MyProfileView()),
    GetPage(name: AppRoutes.reviewRattingView, page: ()=> ReviewRattingView()),
    GetPage(name: AppRoutes.helpSupportView, page: ()=> HelpSupportView()),
    GetPage(name: AppRoutes.sessionHistory, page: ()=> SessionHistory()),
    GetPage(name: AppRoutes.transactionHistoryView, page: ()=>TransactionHistoryView()),
    GetPage(name: AppRoutes.allProductScreen, page: ()=> AllProductScreen()),
    GetPage(name: AppRoutes.productDetailsView, page: ()=> ProductDetailsView()),
    GetPage(name: AppRoutes.orderSummaryView, page: ()=> OrderSummaryView()),
    GetPage(name: AppRoutes.addCartSummary, page: ()=> AddCartSummary()),
    GetPage(name: AppRoutes.myOrderView, page: ()=> MyOrderView()),
    GetPage(name: AppRoutes.psychicsDetailsView, page: ()=> PsychicsDetailsView()),
    GetPage(name: AppRoutes.liveStreamScreen, page: ()=> LiveStreamScreen()),
    GetPage(name: AppRoutes.roleChangeView, page: ()=> RoleChangeView()),

    /// ..........................Psychics Screens.........................
    
    GetPage(name: AppRoutes.loginScreenViews, page: ()=> LoginScreenViews()),
    GetPage(name: AppRoutes.signUpScreenViews, page: ()=> SignUpScreenViews()),
    GetPage(name: AppRoutes.forgotGmailViews, page: ()=> ForgotGmailViews()),
    GetPage(name: AppRoutes.forgotOtpGmailViews, page: ()=> ForgotOtpGmailViews()),
    GetPage(name: AppRoutes.forgotNewPasswordViews, page: ()=> ForgotNewPasswordViews()),
    GetPage(name: AppRoutes.otpScreenViews, page: ()=> OtpScreenViews()),

    GetPage(name: AppRoutes.profileSetupScreenViews, page: ()=>ProfileSetupScreenViews()),
    GetPage(name: AppRoutes.onboardingScreenViewss, page: ()=> OnboardingScreenViewss()),

    GetPage(name: AppRoutes.mainBottomBarScreenViews, page: ()=> MainBottomBarScreenViews()),
    GetPage(name: AppRoutes.earningViewViews, page: ()=> EarningViewViews()),
    GetPage(name: AppRoutes.myLiveViews, page: ()=> MyLiveViews()),
    GetPage(name: AppRoutes.accountViews, page: ()=> AccountViews()),
    GetPage(name: AppRoutes.myProfileViews, page: ()=> MyProfileViews()),
    GetPage(name: AppRoutes.payOutHistoryViews, page: ()=> PayOutHistoryViews()),
    GetPage(name: AppRoutes.privacyPolicyViews, page: ()=> PrivacyPolicyViews()),
    GetPage(name: AppRoutes.recentHistoryAllViewViews, page: ()=> RecentHistoryAllViewViews()),
    GetPage(name: AppRoutes.reviewRattingViews, page: ()=> ReviewRattingViews()),
    GetPage(name: AppRoutes.sessionHistoryViews, page: ()=> SessionHistoryViews()),
    GetPage(name: AppRoutes.storyDayViews, page: ()=> StoryDayViews()),
    GetPage(name: AppRoutes.termsOfServicesViews, page: ()=> TermsOfServicesViews()),
    GetPage(name: AppRoutes.viewAllScreen, page: ()=> ViewAllScreen()),
  ];
}
