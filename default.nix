{ mkDerivation, base, mtl, stdenv, tasty, tasty-hunit
, tasty-quickcheck, tasty-smallcheck
}:
mkDerivation {
  pname = "new-project";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base mtl ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base tasty tasty-hunit tasty-quickcheck tasty-smallcheck
  ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
