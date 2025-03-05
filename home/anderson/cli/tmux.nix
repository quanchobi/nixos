{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    prefix = "C-Space";
    terminal = "xterm-256color";
    plugins = [
      pkgs.tmuxPlugins.tmux-floax
    ];
    extraConfig = ''
      # Change splits to | and - as opposed to " and %
            unbind '"'
            unbind %
            bind | split-window -h
            bind - split-window -v
      # Theming
            set-option -g status-position "top" # put status at top instead of bottom, since that is where nvim goes


            set -g window-status-current-format '#[fg=magenta,bg=#1c2023] *#I #W'
            set -g window-status-format '#[fg=gray,bg=#1c2023] #I #W'
            set -g window-status-last-style 'fg=white,bg=black'

            set -g message-command-style bg=default,fg=yellow
            set -g message-style bg=default,fg=yellow

            set -g pane-active-border-style 'fg=magenta,bg=default'
            set -g pane-border-style 'fg=brightblack,bg=default'

            set -g status-style 'bg=#1c2023' # transparent
            set -g status-left "#[fg=blue,bold,bg=#1c2023]   #S   "
            set -g status-right "#[fg=#b4befe,bold,bg=#1c2023]%a %Y-%m-%d 󱑒 %l:%M %p"
    '';
  };
}
