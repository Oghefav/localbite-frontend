import 'package:get/get_navigation/get_navigation.dart';
import 'package:locabite/routes/chef/chef_home_page.dart';
import 'package:locabite/routes/chef/chef_main_page.dart';
import 'package:locabite/routes/chef/chef_sign_up_page.dart';
import 'package:locabite/routes/common/login_page.dart';
import 'package:locabite/routes/common/role_page.dart';
import 'package:locabite/routes/common/splash_page.dart';
import 'package:locabite/routes/customer/Homepage/home_page.dart';
import 'package:locabite/routes/customer/account_page.dart';
import 'package:locabite/routes/customer/cart_page.dart';
import 'package:locabite/routes/customer/customer_sigup_page.dart';
import 'package:locabite/routes/customer/search_page.dart';
import 'package:locabite/routes/driver/driver_sign_up_page.dart';

class AppRoute {
  static const String initial = '/';
  static const String splashPage = '/splash-page';
  static const String cartPage = '/cart-page';
  static const String searchPage = '/search-page';
  static const String accoutPage = '/account-page';
  static const String homePage = '/home-page';
  static const String rolePage = '/role-page';
  static const String loginPage = '/login-page';
  static const String customerSignUpPage = '/customer-sign-up-page';
  static const String chefSignUpPage = '/chef-sign-up-page';
  static const String driverSignUpPage = '/driver-sign-up-page';
  static const String chefMainPage = '/chef-main-page';
  static const String chefHomePage = '/chef-Home-page';

  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
  static String getCartPage() => cartPage;
  static String getChefMainPage() => chefMainPage;
  static String getChefHomePage() => chefHomePage;
  static String getLoginPage() => loginPage;
  static String getSearchPage() => searchPage;
  static String getAccountPage() => accoutPage;
  static String getHomepage() => homePage;
  static String getRolePage() => rolePage;
  static String getCustomerSignUpPage() => customerSignUpPage;
  static String getChefSignUpPage() => chefSignUpPage;
  static String getDriverSignUpPage() => driverSignUpPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: rolePage, page: () => RolePage()),
    GetPage(name: chefMainPage, page: () => ChefMainPage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: chefHomePage, page: () => ChefHomePage()),
    GetPage(name: cartPage, page: () => CartPage()),
    GetPage(name: searchPage, page: () => SearchPage()),
    GetPage(name: accoutPage, page: () => AccountPage()),
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: customerSignUpPage, page: () => CustomerSigupPage()),
    GetPage(name: chefSignUpPage, page: () => ChefSignUpPage()),
    GetPage(name: driverSignUpPage, page: () => DriverSignUpPage()),
  ];
}
