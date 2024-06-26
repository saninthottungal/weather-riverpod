import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/city_provider.dart';
import 'package:weather_riverpod/common/providers/weather_service_provider.dart';
import 'package:weather_riverpod/models/forecast_entity.dart';

final forecastProvider =
    AsyncNotifierProvider<ForecastNotififer, List<ForecastEntity>>(
        ForecastNotififer.new);

class ForecastNotififer extends AsyncNotifier<List<ForecastEntity>> {
  @override
  FutureOr<List<ForecastEntity>> build() async {
    state = const AsyncLoading();
    final weatherService = ref.watch(weatherServiceProvider);
    final cityModel = await ref.watch(cityProvider.future);
    return weatherService.getForecastWeather(cityModel);
  }
}
