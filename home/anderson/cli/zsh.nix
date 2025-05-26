{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      styles = { };
    };
    initContent = ''
      autoload -U bashcompinit
      bashcompinit
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec Hyprland
          fi
    '';
    profileExtra = '''';
    envExtra = '''';
    sessionVariables = { };
    shellAliases = { };
  };
}
