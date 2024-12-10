import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gas/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppInitRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ShowSellerRoute.page),
        AutoRoute(page: FetchSellersCreen.page),
        AutoRoute(page: ApplicationRoute.page),
        AutoRoute(page: GetStationsRoute.page),
        AutoRoute(page: CreateStationRoute.page),
        AutoRoute(page: UpdateStationRoute.page),
        AutoRoute(page: CreateSellerRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ShowStoreRoute.page),
        AutoRoute(page: CreateSellerRoute.page),
        AutoRoute(page: CreateStoresRoute.page),
        AutoRoute(page: CreateOrdersRoute.page),
        AutoRoute(page: PaymentRoute.page),
        AutoRoute(page: SearchStoresRoute.page),
        AutoRoute(page: OrderHistoryRoute.page),
        AutoRoute(page: StoreGalleryRoute.page),
      ];
}
