package authz

default allow = false

allow {
  input.user.roles[_] == "viewer"
  input.method == "GET"
  input.path == ["api", "hello"]
}