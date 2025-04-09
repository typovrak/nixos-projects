# nixos-projects

nixos-projects = fetchGit {
	url = "https://github.com/typovrak/nixos-projects.git";
	ref = "main";
};

(import "${nixos-projects}/configuration.nix")
