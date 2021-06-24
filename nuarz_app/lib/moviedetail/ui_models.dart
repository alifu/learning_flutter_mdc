class CrewUiModel {
  CrewUiModel(this.name, this.image, this.role);

  final String name;
  final String image;
  final String role;

  @override
  bool operator ==(Object other) =>
      other is CrewUiModel &&
      name == other.name &&
      image == other.image &&
      role == other.role;

  @override
  int get hashCode {
    int result = name.hashCode;
    result = 31 * result + image.hashCode;
    result = 31 * result + role.hashCode;
    return result;
  }
}
