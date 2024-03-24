import 'dart:convert';

import 'package:animelist/app/config.dart';
import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/data/data_sources/base_anime_list_data_source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeListDataSource implements BaseAnimeListDataSource {
  @override
  Future<Map<String, dynamic>> getAnimeList(PaginateParams params) async {
    try {
      final uri = Uri.parse(
        '${AppConfig.baseURL}/v4/top/anime?page=${params.page}&limit=${params.perPage}',
      );
      debugPrint(uri.toString());
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        debugPrint('Failed to fetch data');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to fetch data');
    }
  }
}
