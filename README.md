# Haskell development environment for nix 

[Nix-shell](https://nixos.wiki/wiki/Development_environment_with_nix-shell) based development environment for Haskell.

## Installation
In a shell, set the project name:
```bash
projectname=my-project
```

Download template and update references:
```bash
git clone https://github.com/turnerdev/haskell-nix-template.git ./$projectname
find . -type f -exec sed -i 's/new-project/$projectname/g' {} +
mv new-project.cabal $projectname.cabal
```

Build and run:
```bash
cabal run my-project
```

After making changes to the cabal config, run:
```bash
cabal2nix . > default.nix
```

## License
[MIT](https://choosealicense.com/licenses/mit/)

