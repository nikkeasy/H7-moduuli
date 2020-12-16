# Config files for new users  
/etc/skel/:
  file.recurse:
    - source: salt://files/usersettings

# Other config files that are not located in users home directory
/etc/:
  file.recurse:
    - source: salt://files/nousersettings/etc

# Blender related config files (in this case theme files) located in usr directory
/usr/share/blender/scripts/presets/interface_theme:
  file.recurse: 
    -  source: salt://files/nousersettings/usr/

