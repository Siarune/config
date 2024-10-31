# Nixos config build tool
def "nb" [
	--raw (-r) # Nonformatted output
] {
	cd /etc/nixos
	if $raw {
		nix flake metadata
	} else {
		nix flake metadata --json | from json | table --expand --expand-deep 2
	}
}

# Dry build
def "nb build" [] {
	sudo nixos-rebuild build
}

# Build and activate
def "nb switch" [
	--test (-t) # Don't preserve activation
] {
	if $test {
		sudo nixos-rebuild test
	} else {
		sudo nixos-rebuild switch
	}
}

# Update sources and rebuild
def "nb upgrade" [
] {
	cd /etc/nixos
	sudo flake update
	cd
	sudo nixos-rebuild switch
}

# Clean up old generations
def "nb gc" [
	depth = 0
] {
	sudo nix-env --delete-generations +$depth
	sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +$depth
	sudo nix-store --gc
}
