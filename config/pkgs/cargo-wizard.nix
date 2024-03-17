{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "cargo-wizard";
  version = "0.2.2";
  src = pkgs.fetchCrate {
    crateName = pname;
    version = version;
    sha256 = "026p64n3a3alw5fir0xnnb8h8bd53lqq9028r6685qsfh7fxb9n9";
  };

  cargoSha256 = "sha256-6+kyb1zmNEDrVdh0gQJL5IyEwEUWWdtGtRzknBaETDs=";

  meta = with pkgs.lib; {
    description = "Cargo subcommand for configuring Cargo projects for best performance. ";
    homepage = "https://crates.io/crates/cargo-wizard";
    license = with licenses; [mit];
    maintainers = with maintainers; ["Kobzol"];
  };
}
