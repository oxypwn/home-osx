#!/bin/bash
(for FILE in *.flac ; do ffmpeg -i "$FILE" -f mp3 -ab 192000 "`basename "$FILE" .flac`.mp3" || break; done)

