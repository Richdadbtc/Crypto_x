part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const PROFILE = _Paths.PROFILE;
  static const MARKET = _Paths.MARKET;
  static const TRADE = _Paths.TRADE;
  static const MINING = _Paths.MINING;
  static const WALLET = _Paths.WALLET;
  static const P2P = _Paths.P2P;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const MARKET = '/market';
  static const TRADE = '/trade';
  static const MINING = '/mining';
  static const WALLET = '/wallet';
  static const P2P = '/p2p';
}

abstract class Histroy {
  static const HISTORY = '/history';
  static const SIGNUP = '/signup';
}