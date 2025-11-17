import 'package:get/get_navigation/get_navigation.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/routes/chef/add_meal_page.dart';
import 'package:locabite/routes/chef/chef_edit_profile_page.dart';
import 'package:locabite/routes/chef/chef_home_page.dart';
import 'package:locabite/routes/chef/chef_main_page.dart';
import 'package:locabite/routes/chef/chef_profile_page.dart';
import 'package:locabite/routes/chef/chef_sign_up_page.dart';
import 'package:locabite/routes/chef/edit_meal_page.dart';
import 'package:locabite/routes/chef/meal_management_page.dart';
import 'package:locabite/routes/chef/Transaction_page.dart';
import 'package:locabite/routes/common/account_setup_page.dart';
import 'package:locabite/routes/common/all_reviews_Page.dart';
import 'package:locabite/routes/common/login_page.dart';
import 'package:locabite/routes/common/role_page.dart';
import 'package:locabite/routes/common/splash_page.dart';
import 'package:locabite/routes/common/validate_pin.dart';
import 'package:locabite/routes/customer/Homepage/home_page.dart';
import 'package:locabite/routes/customer/account_page.dart';
import 'package:locabite/routes/customer/card_payment_page.dart';
import 'package:locabite/routes/customer/cart_page.dart';
import 'package:locabite/routes/customer/customer_sigup_page.dart';
import 'package:locabite/routes/customer/edit_profile_page.dart';
import 'package:locabite/routes/customer/location_selection_page.dart';
import 'package:locabite/routes/customer/meal_detail_page.dart';
import 'package:locabite/routes/customer/order_history_page.dart';
import 'package:locabite/routes/customer/payment_failed_page.dart';
import 'package:locabite/routes/customer/payment_method_page.dart';
import 'package:locabite/routes/customer/payment_succes_page.dart';
import 'package:locabite/routes/customer/search_page.dart';
import 'package:locabite/routes/driver/delivery_history.dart';
import 'package:locabite/routes/driver/driver_dashboard_page.dart';
import 'package:locabite/routes/driver/driver_main_page.dart';
import 'package:locabite/routes/driver/driver_profile_page.dart';
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
  static const String validatePinPage = '/validate-pin-page';
  static const String cardPaymentPage = '/card-payment-page';
  static const String locationSelectionPage = '/location-selection-page';
  static const String orderHistoryPage = '/order-history-page';
  static const String orderSummaryPage = '/order-summary-page';
  static const String paymentFailurePage = '/payment-failure-page';
  static const String paymentMethodPage = '/payment-method-page';
  static const String paymentSuccessPage = '/payment-success-page';
  static const String chefHomePage = '/chef-Home-page';
  static const String addMealPage = '/add-meal-page';
  static const String editMealPage = '/edit-meal-page';
  static const String mealDetailPage = '/meal-detail-page';
  static const String mealManagementPage = '/meal-management-page';
  static const String allReviewsPage = '/all-reviews-page';
  static const String transactionPage = '/transaction-page';
  static const String driverProfilePage = '/driver-profile-page';
  static const String chefProfilePage = '/chef-profile-page';
  static const String chefEditProfilePage = '/chef-edit-profile-page';
  static const String driverDashboardPage = '/driver-dashbord-page';
  static const String driverMainPage = '/driver-main-page';
  static const String deliveryHistoryPage = '/delivery-hist0ry-page';
  static const String accountSetupPage  = '/account-setup-page';
  static const String customerEditProfilePage  = '/customer-edit-profile-page';



  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
  static String getCartPage() => cartPage;
  static String getmealManagementPage() => mealManagementPage;
  static String getAddMealPage() => addMealPage;
  static String getEditMealPage(Meal meal) => '$editMealPage?meal=$meal';
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
    GetPage(name: addMealPage, page: () => AddMealPage()),
    GetPage(name: editMealPage, page: () => EditMealPage()),
    GetPage(name: rolePage, page: () => RolePage()),
    GetPage(name: mealManagementPage, page: () => MealManagementPage()),
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
    GetPage(name: mealDetailPage, page: () => MealDetailPage()),
    GetPage(name: allReviewsPage, page: () => AllReviewsPage()),
    GetPage(name: transactionPage, page: () => TransactionPage()),
    GetPage(name: driverDashboardPage, page: () => DriverDashboardPage()),
    GetPage(name: driverProfilePage, page: ()=> DriverProfilePage()) ,
    GetPage(name: chefProfilePage, page: ()=> ChefProfilePage()) ,
    GetPage(name: chefEditProfilePage, page: ()=> ChefEditProfilePage()) ,
    GetPage(name: deliveryHistoryPage, page: ()=> DeliveryHistoryPage()) ,
    GetPage(name: driverMainPage, page: () => DriverMainPage()) ,
    GetPage(name: accountSetupPage, page: () => AccountSetupPage()) ,
    GetPage(name: paymentFailurePage, page: () => PaymentFailedPage()), 
    GetPage(name: paymentMethodPage, page: () => PaymentMethodsPage()), 
    GetPage(name: cardPaymentPage, page: () => CardPaymentPage()),
    GetPage(name: validatePinPage, page: () => ValidatePinPage()) ,
    GetPage(name: locationSelectionPage, page: () => LocationSelectionPage()) ,
    GetPage(name: orderHistoryPage, page: () => OrderHistoryScreen()) ,
    GetPage(name: customerEditProfilePage, page: () => EditProfileScreen()),
  ];
}
