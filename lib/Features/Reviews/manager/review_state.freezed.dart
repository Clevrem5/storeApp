// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewState {
  List<ReviewModel> get reviews;
  ReviewStatus get status;
  ReviewStatsModel? get stats;
  ReviewStatus get statsStatus;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      _$ReviewStateCopyWithImpl<ReviewState>(this as ReviewState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewState &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.statsStatus, statsStatus) ||
                other.statsStatus == statsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(reviews), status, stats, statsStatus);

  @override
  String toString() {
    return 'ReviewState(reviews: $reviews, status: $status, stats: $stats, statsStatus: $statsStatus)';
  }
}

/// @nodoc
abstract mixin class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) _then) =
      _$ReviewStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ReviewModel> reviews,
      ReviewStatus status,
      ReviewStatsModel? stats,
      ReviewStatus statsStatus});
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res> implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._self, this._then);

  final ReviewState _self;
  final $Res Function(ReviewState) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? status = null,
    Object? stats = freezed,
    Object? statsStatus = null,
  }) {
    return _then(_self.copyWith(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
      stats: freezed == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ReviewStatsModel?,
      statsStatus: null == statsStatus
          ? _self.statsStatus
          : statsStatus // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
    ));
  }
}

/// @nodoc

class _ReviewState implements ReviewState {
  const _ReviewState(
      {final List<ReviewModel> reviews = const <ReviewModel>[],
      this.status = ReviewStatus.initial,
      this.stats,
      this.statsStatus = ReviewStatus.initial})
      : _reviews = reviews;

  final List<ReviewModel> _reviews;
  @override
  @JsonKey()
  List<ReviewModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final ReviewStatus status;
  @override
  final ReviewStatsModel? stats;
  @override
  @JsonKey()
  final ReviewStatus statsStatus;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewStateCopyWith<_ReviewState> get copyWith =>
      __$ReviewStateCopyWithImpl<_ReviewState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewState &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.statsStatus, statsStatus) ||
                other.statsStatus == statsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reviews),
      status,
      stats,
      statsStatus);

  @override
  String toString() {
    return 'ReviewState(reviews: $reviews, status: $status, stats: $stats, statsStatus: $statsStatus)';
  }
}

/// @nodoc
abstract mixin class _$ReviewStateCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$ReviewStateCopyWith(
          _ReviewState value, $Res Function(_ReviewState) _then) =
      __$ReviewStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ReviewModel> reviews,
      ReviewStatus status,
      ReviewStatsModel? stats,
      ReviewStatus statsStatus});
}

/// @nodoc
class __$ReviewStateCopyWithImpl<$Res> implements _$ReviewStateCopyWith<$Res> {
  __$ReviewStateCopyWithImpl(this._self, this._then);

  final _ReviewState _self;
  final $Res Function(_ReviewState) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviews = null,
    Object? status = null,
    Object? stats = freezed,
    Object? statsStatus = null,
  }) {
    return _then(_ReviewState(
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
      stats: freezed == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ReviewStatsModel?,
      statsStatus: null == statsStatus
          ? _self.statsStatus
          : statsStatus // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
    ));
  }
}

// dart format on
