{ lib, stdenv, nixpkgs, fetchurl }:
stdenv.mkDerivation (finalAttrs: {
  pname = "rose-pine-hyprcursor";
  version = "0.3.2";
  src = nixpkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-hyprcursor";
    rev = "d2c0e6802f0ed1e7c638bb27b5aa8587b578d083";
    sha256 = "sha256-ArUX5qlqAXUqcRqHz4QxXy3KgkfasTPA/Qwf6D2kV0U=";
  };
  tarball = builtins.fetchurl {
    url = "https://github.com/rose-pine/cursor/releases/download/v1.1.0/BreezeX-RosePine-Linux.tar.xz";
    sha256 = "sha256:1bx1i499978flp467kvcnpkdjy1bfz79g2k3kwh61r70x2fdac5k";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/rose-pine-hyprcursor
    cp -R . $out/share/icons/rose-pine-hyprcursor/
    tar -xvf $tarball -C $out/share/icons/
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soho vibes for Cursors";
    downloadPage = "https://github.com/ndom91/rose-pine-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ndom91 ];
  };
})
