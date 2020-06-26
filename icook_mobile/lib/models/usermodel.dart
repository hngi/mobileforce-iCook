class MainUser{
  final String email;
  final String id;
  final String photoUrl;
  final String username;
  final String displayName;
  final String bio;
  final Map followers;
  final Map following;

  MainUser(this.email, this.id, this.photoUrl, this.username, this.displayName, this.bio, this.followers, this.following);
}