#!/data/data/com.termux/files/usr/bin/sh

# check for unzip before we continue
if [ ! "$(command -v unzip)" ]; then
  echo 'unzip is required but was not found. Install unzip first and then run this script again.' >&2
  exit 1
fi

_fetch_sources(){
  wget -O /data/data/com.termux/files/usr/tmp/nanorc.zip https://github.com/scopatz/nanorc/archive/master.zip
  mkdir -p ~/.nano/

  cd ~/.nano/ || exit
  unzip -o "/data/data/com.termux/files/usr/tmp/nanorc.zip"
  mv nanorc-master/* ./
  rm -rf nanorc-master
  rm /data/data/com.termux/files/usr/tmp/nanorc.zip
}

_update_nanorc(){
  touch ~/.nanorc
      
  # add all includes from ~/.nano/nanorc if they're not already there
  while read -r inc; do
      if ! grep -q "$inc" "${NANORC_FILE}"; then
          echo "$inc" >> "$NANORC_FILE"
      fi
  done < ~/.nano/nanorc
}

_update_nanorc_lite(){
  sed -i '/include "\/data\/data\/com.termux\/files/\/usr\/share\/nano\/\*\.nanorc"/i include "~\/.nano\/*.nanorc"' "${NANORC_FILE}"
}

NANORC_FILE=~/.nanorc

case "$1" in
 -l|--lite)
   UPDATE_LITE=1;;
 -h|--help)
   echo "Install script for nanorc syntax highlights"
   echo "Call with -l or --lite to update .nanorc with secondary precedence to existing .nanorc includes"
   exit 0
 ;;
esac

_fetch_sources;
if [ $UPDATE_LITE ];
then
  _update_nanorc_lite
else
  _update_nanorc
fi
