{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "caydence";
  version = "0.1.0";
  sha = "026p64n3a3alw5fir0xnnb8h8bd53lqq9028r6685qsfh7fxb9n9";

  src = pkgs.fetchCrate {
    crateName = pname;
    version = version;
    sha256 = sha;
  };

  cargoSha256 = sha;

  meta = with pkgs.lib; {
    description = "a wallpaper switching utility with pomodoro capabilities";
    homepage = "https://crates.io/crates/caydence";
    license = with licenses; [mit];
    maintainers = with maintainers; ["joshcbrown"];
  };
}
