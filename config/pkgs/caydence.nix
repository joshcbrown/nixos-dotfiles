{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "caydence";
  version = "0.1.0";
  buildInputs = with pkgs; [
    pkg-config # Recommended for finding library paths
    libnotify
    gdk-pixbuf
    glib
  ];
  src = pkgs.fetchCrate {
    crateName = pname;
    version = version;
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
