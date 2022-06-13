#!/system/bin/sh

set_rw() {
  for part in system vendor product odm; do
    blockdev --setrw /dev/block/mapper/$part;
    echo "I:Attempt to include $part to rw" >> /tmp/recovery.log;
  done
}

set_rw;
exit 0;
