{ pkgs, stdenv, fetchgit }:
stdenv.mkDerivation {
  name = "valhieim-runner";
  src = fetchgit  {
    url = "https://github.com/johnviolano/valheim-runner";
    rev = "609338568ea86cfd7009a14c42f3059ffde3186b";
    sha256 = "0j84v0rq3x8vdifp4qwyb74nd4dbgw9kvm2a977anwgjih814l2s"; 
  };
  installPhase = 
  ''
    mkdir -p $out/bin
    mv start_valheim.sh $out/bin
  '';
}
