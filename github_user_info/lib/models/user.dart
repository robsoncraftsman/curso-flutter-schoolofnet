class User {
  final String name;
  final String avatarUrl;
  final String blog;
  final int followers;
  final int publicRepos;

  User(this.name, this.avatarUrl, this.blog, this.followers, this.publicRepos);

  factory User.fromJson(Map<String, dynamic> props) {
    return User(props['name'], props['avatar_url'], props['blog'],
        props['followers'], props['public_repos']);
  }
}
