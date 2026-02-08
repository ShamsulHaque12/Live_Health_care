enum PsychicStatus { online, busy, offline }

class PsychicModel {
  final String id;
  final String name;
  final double pricePerMin;
  final String specialties;
  final PsychicStatus status;
  final String imageUrl;
  final List<String> badges;

  PsychicModel({
    required this.id,
    required this.name,
    required this.pricePerMin,
    required this.specialties,
    required this.status,
    required this.imageUrl,
    required this.badges,
  });
}