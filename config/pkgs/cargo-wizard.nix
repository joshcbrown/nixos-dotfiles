{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "cargo-wizard";
  version = "0.2.2";
  src = pkgs.fetchCrate {
    crateName = pname;
    version = version;
    sha256 = "sha256-LBly3Lnj3ohgolcLv/DKPHJz8a68BaqHfSvQJioLmns=";
  };

  cargoSha256 = "sha256-wUMdWGUJR9dJ4XRlDFAvHwxCzLSb3WdRhrXt0kr2+Fc=";

  meta = with pkgs.lib; {
    description = "Cargo subcommand for configuring Cargo projects for best performance. ";
    homepage = "https://crates.io/crates/cargo-wizard";
    license = with licenses; [mit];
    maintainers = with maintainers; ["Kobzol"];
  };
}
