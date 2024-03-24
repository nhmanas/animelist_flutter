// ignore_for_file: avoid_dynamic_calls

class PaginatedData<T> {
  PaginatedData({
    required this.pagination,
    required this.data,
  });

  factory PaginatedData.fromJson(Map<String, dynamic> json, T dataFromJson) =>
      PaginatedData(
        pagination: Pagination.fromJson(json),
        data: dataFromJson,
      );

  final Pagination pagination;
  final T data;
}

class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json['pagination']['last_visible_page'] as int,
        hasNextPage: json['pagination']['has_next_page'] as bool,
        currentPage: json['pagination']['current_page'] as int,
        items:
            Items.fromJson(json['pagination']['items'] as Map<String, dynamic>),
      );
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final Items items;
}

class Items {
  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json['count'] as int,
        total: json['total'] as int,
        perPage: json['per_page'] as int,
      );
  final int count;
  final int total;
  final int perPage;
}
