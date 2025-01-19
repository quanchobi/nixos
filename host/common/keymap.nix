{
  # Kanata is a service that allows rebinding keys.
  services.kanata = {
    enable = true;
    keyboards = {
      main = {
        devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
	config =
	''
	  (defsrc
	    caps)
	  (deflayermap (default-layer)
            ;; tap caps lock as escape, hold caps lock as left control
            caps (tap-hold 200 200 esc lctl))
	'';
      };
    };
  };
}
