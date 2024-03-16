{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  src = pkgs.fetchCrate {
    crateName = "caydence";
    version = "0.1.0";
    sha256 = "026p64n3a3alw5fir0xnnb8h8bd53lqq9028r6685qsfh7fxb9n9";
  };

  cargoSha256 = "sha256-6+kyb1zmNEDrVdh0gQJL5IyEwEUWWdtGtRzknBaETDs=";

  meta = with pkgs.lib; {
    description = "a wallpaper switching utility with pomodoro capabilities";
    homepage = "https://crates.io/crates/caydence";
    license = with licenses; [mit];
    maintainers = with maintainers; ["joshcbrown"];
  };
}
