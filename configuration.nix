{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.projects = ''
		mkdir -p ${home}/projects
		chown ${username}:${group} ${home}/projects
		chmod 755 ${home}/projects
	'';
}
