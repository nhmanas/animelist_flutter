import 'dart:convert';

import 'package:animelist/app/config.dart';
import 'package:animelist/features/detail/data/data_sources/base_anime_detail_data_source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeDetailDataSource implements BaseAnimeDetailDataSource {
  @override
  Future<Map<String, dynamic>> getCharacters(String animeId) async {
    try {
      final response = await http
          .get(Uri.parse('${AppConfig.baseURL}/v4/anime/$animeId/characters'));
      if (response.statusCode == 200) {
        final resp = json.decode(response.body) as Map<String, dynamic>;

        return resp;
      } else {
        debugPrint('Failed to fetch characters');
        throw Exception('Failed to fetch characters');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to fetch characters');
    }
  }

  @override
  Future<Map<String, dynamic>> getAnimeById(String animeId) async {
    try {
      final response =
          await http.get(Uri.parse('${AppConfig.baseURL}/v4/anime/$animeId'));
      if (response.statusCode == 200) {
        final resp = json.decode(response.body) as Map<String, dynamic>;

        return resp;
      } else {
        debugPrint('Failed to fetch anime');
        throw Exception('Failed to fetch anime');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to fetch anime');
    }
  }
}
