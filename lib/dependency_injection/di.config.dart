// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../core/network/network_info/network_info.dart' as _i11;
import '../src/data/api/api_manger.dart' as _i793;
import '../src/data/api/app_interceptors.dart' as _i506;
import '../src/data/api/network_factory.dart' as _i13;
import '../src/data/data_source/local_data_source/news_local_data_source/news_local_data_source.dart'
    as _i285;
import '../src/data/data_source/local_data_source/news_local_data_source/news_local_data_source_impl.dart'
    as _i808;
import '../src/data/data_source/local_data_source/source_local_data_source/source_local_data_source.dart'
    as _i1063;
import '../src/data/data_source/local_data_source/source_local_data_source/source_local_data_source_impl.dart'
    as _i99;
import '../src/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart'
    as _i943;
import '../src/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source_impl.dart'
    as _i95;
import '../src/data/data_source/remote_data_source/search_remote_data_source/search_remote_data_source.dart'
    as _i669;
import '../src/data/data_source/remote_data_source/search_remote_data_source/search_remote_data_source_impl.dart'
    as _i767;
import '../src/data/data_source/remote_data_source/source_remote_data_source/source_remote_data_source.dart'
    as _i750;
import '../src/data/data_source/remote_data_source/source_remote_data_source/source_remote_data_source_impl.dart'
    as _i600;
import '../src/data/mappers/news_mapper.dart' as _i186;
import '../src/data/mappers/search_mapper.dart' as _i912;
import '../src/data/mappers/source_mapper.dart' as _i195;
import '../src/data/repositories/news_repository_impl.dart' as _i492;
import '../src/data/repositories/search_repository_impl.dart' as _i303;
import '../src/data/repositories/source_repository_impl.dart' as _i339;
import '../src/domain/repositories/news_repository.dart' as _i813;
import '../src/domain/repositories/search_repository.dart' as _i55;
import '../src/domain/repositories/source_repository.dart' as _i795;
import '../src/domain/use_cas/get_news_use_case.dart' as _i526;
import '../src/domain/use_cas/get_search_use_case.dart' as _i598;
import '../src/domain/use_cas/get_source_use_case.dart' as _i785;
import '../src/presentation/home/view_model/home_view_model/home_cubit.dart'
    as _i79;
import '../src/presentation/home/view_model/news_view_model/news_cubit.dart'
    as _i865;
import '../src/presentation/home/view_model/search_view_model/search_cubit.dart'
    as _i455;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final networkFactoryDio = _$NetworkFactoryDio();
    await gh.factoryAsync<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
      preResolve: true,
    );
    gh.factory<_i506.AppInterceptors>(() => _i506.AppInterceptors());
    gh.factory<_i79.HomeCubit>(() => _i79.HomeCubit());
    gh.lazySingleton<_i361.LogInterceptor>(
        () => networkFactoryDio.providePretty());
    gh.factory<_i186.NewsMapper>(() => _i186.NewsMapperImpl());
    gh.factory<_i195.SourceMapper>(() => _i195.SourceMapperImpl());
    gh.factory<_i912.SearchMapper>(() => _i912.SearchMapperImpl());
    gh.factory<_i1063.SourceLocalDataSource>(() =>
        _i99.SourceLocalDataSourceImpl(sourceMapper: gh<_i195.SourceMapper>()));
    gh.factory<_i285.NewsLocalDataSource>(
        () => _i808.NewsLocalDataSourceImpl(gh<_i186.NewsMapper>()));
    gh.factory<_i11.NetworkInfo>(
        () => _i11.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i361.Dio>(
        () => networkFactoryDio.dioProvider(gh<_i506.AppInterceptors>()));
    gh.factory<_i793.ApiManger>(() => _i793.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i943.NewsRemoteDataSource>(() => _i95.NewsRemoteDataSourceImpl(
          gh<_i793.ApiManger>(),
          gh<_i186.NewsMapper>(),
        ));
    gh.factory<_i750.SourceRemoteDataSource>(
        () => _i600.SourceRemoteDataSourceImpl(
              gh<_i793.ApiManger>(),
              gh<_i195.SourceMapper>(),
            ));
    gh.factory<_i669.SearchRemoteDataSource>(
        () => _i767.SearchRemoteDataSourceImpl(
              gh<_i912.SearchMapper>(),
              gh<_i793.ApiManger>(),
            ));
    gh.factory<_i795.SourceRepository>(() => _i339.SourceRepositoryImpl(
          gh<_i750.SourceRemoteDataSource>(),
          gh<_i1063.SourceLocalDataSource>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i785.GetSourceUseCase>(
        () => _i785.GetSourceUseCase(gh<_i795.SourceRepository>()));
    gh.factory<_i813.NewsRepository>(() => _i492.NewsRepositoryImpl(
          gh<_i943.NewsRemoteDataSource>(),
          gh<_i285.NewsLocalDataSource>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i55.SearchRepository>(() => _i303.SearchRepositoryImpl(
        searchRemoteDataSource: gh<_i669.SearchRemoteDataSource>()));
    gh.factory<_i526.GetNewsUseCase>(
        () => _i526.GetNewsUseCase(newsRepository: gh<_i813.NewsRepository>()));
    gh.factory<_i598.GetSearchUseCase>(() =>
        _i598.GetSearchUseCase(searchRepository: gh<_i55.SearchRepository>()));
    gh.factory<_i455.SearchCubit>(
        () => _i455.SearchCubit(gh<_i598.GetSearchUseCase>()));
    gh.factory<_i865.NewsCubit>(() => _i865.NewsCubit(
          gh<_i526.GetNewsUseCase>(),
          gh<_i785.GetSourceUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

class _$NetworkFactoryDio extends _i13.NetworkFactoryDio {}
