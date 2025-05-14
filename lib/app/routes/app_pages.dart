import 'package:crypto_wallet/app/modules/p2p/p2p_binding.dart';
import 'package:crypto_wallet/app/modules/p2p/p2p_view.dart';
import 'package:crypto_wallet/app/modules/wallet/wallet_binding.dart';
import 'package:crypto_wallet/app/modules/wallet/wallet_view.dart';
import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/market/market_binding.dart';
import '../modules/market/market_view.dart';
import '../modules/trade/trade_binding.dart';
import '../modules/trade/trade_view.dart';
import '../modules/mining/mining_binding.dart';
import '../modules/mining/mining_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MARKET,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: _Paths.TRADE,
      page: () => const TradeView(),
      binding: TradeBinding(),
    ),
    GetPage(
      name: _Paths.MINING,
      page: () => const MiningView(),
      binding: MiningBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.P2P,
      page: () => const P2PView(),
      binding: P2PBinding(),
    ),
  ];
}