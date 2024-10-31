{ ... }: {
imports = [
	./pkg.nix
	./sh.nix
];

nixpkgs = {
	overlays = [];
	config = {
		allowUnfree = true;
		allowUnfreePredicate = _: true;
	};
};

home = {
	username = "sia";
	homeDirectory = "/home/sia";
	sessionPath = [
		"$HOME/.local/bin"
	];

	file = {
		"scripts" = {
			source = ./scripts;
			target = ".local/share/scripts";
		};
	};
};

programs.git = {
	enable = true;
	userName = "siarune";
	userEmail = "aidan.sharp@siarune.dev";
};

systemd.user.startServices = "sd-switch";
home.stateVersion = "24.11";
}
