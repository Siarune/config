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
	sudo nixos-rebuild build --quiet
}

# Build and activate
def "nb switch" [
	--test (-t) # Don't preserve activation
] {
	cleanBackupFiles
	if $test {
		sudo nixos-rebuild test --quiet
	} else {
		sudo nixos-rebuild switch --quiet
	}
}

# Update sources and rebuild
def "nb upgrade" [
] {
	cd /etc/nixos
	sudo nix flake update
	cd
	nb switch
}

# Clean up old generations
def "nb gc" [
	depth = '+7d'
] {
	print 'cleaning userspace...'
	sudo nix-env --delete-generations $depth --quiet
	print 'cleaning system...'
	sudo nix-env -p /nix/var/nix/profiles/system --delete-generations $depth --quiet
	sudo nix-store --gc --quiet
}

const dirsToCheck = [
	~/.mozilla/firefox/sia
]

def "cleanBackupFiles" [] {
	$dirsToCheck | each {|d| cd $d ; ls -a | where name =~ '\.bk' | each {|e| rm $e.name }}
}

# Search nixpkgs
def "nb search" [
	pkg: string # Package to search for
] {
	nix search nixpkgs $pkg --quiet
}

# Execute commands without installing
def "nx" [
	pkg: string
	args?: string
] {
	let cmd = [$pkg, $args] | str join ' '
	nix-shell -p $pkg --run $cmd
}
