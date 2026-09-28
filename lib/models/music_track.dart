class MusicTrack {
  MusicTrack({
    required this.name,
    this.path,
    this.volume = 0.8,
    this.startAt = Duration.zero,
    this.endAt = const Duration(seconds: 30),
  });

  final String name;
  final String? path;
  final double volume;
  final Duration startAt;
  final Duration endAt;
}
