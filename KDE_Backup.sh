#!/bin/bash
#
# --- Infos -----------------------------------------------------------------------------------
#
#   Scriptname      KDE-Backup.sh
#   Funktion        Backup mit rsync & kdialog (KDE-Dialoge)
#
#   Beschreibung        Es wird ein Backup von den Ordnern, die in den Variablen
#               $quelle_1 bis $quelle_9 angegeben sind, nach Ziel, welches in der
#               Variablen $ziel steht, erstellt.
#               Wenn dem Skript Ordner übergeben wurden, werden diese im
#               Bereich "--- Ordner wurden übergeben ---" in die Variablen
#               übernommen, das Ziel kann in diesem Fall ein anderes sein.
#
#   benötigt        bash, rsync & kdialog
#
#   Autor           Naubaddi
#
#   Status          noch in Arbeit ( wer wird schon fertig??? )
#   Fehler          keine, oder??? ( Naubadi is pörfekt )
#
#   Start           25.07.2003
#   Stand           30.11.2009
#
# --- Variablen -------------------------------------------------------------------------------
#
# $HOME             # der Home-Ordner (vom System)
# $USER             # der User-Name (vom System)
$1              # Aufrufparameter, wurden Ordner übergeben?
log_datei=""            # Textdatei mit einer Auflistung der gesicherten Dateien
error_datei=""          # Textdatei für eventuelle Fehlermeldungen
le_ordner=""            # ein Ordner für die log/error Dateien
fehler=""           # für aufgetretene Fehler
backup_x="1"            # Zähler für die while-Schleife
quelle="$1"         # Quelle, die gesichert werden soll (Pfad & Ordner)
quelle_ordner=""        # nur der Ordner von quelle
max_quellen="9"         # max. Anzahl der Quellen, die gesichert werden können
#
# --- Parameter für rsync hier eintragen ------------------------------------------------------
#
para="-av"
#
# --- ab hier die Ordner, die gesichert werden sollen, eintragen --------------------------------
#
quelle_1="$HOME/Bilder"
quelle_2="$HOME/Desktop"
quelle_3="$HOME/Dokumente"
quelle_4="$HOME/Downloads"
quelle_5="$HOME/Musik"
quelle_6="$HOME/Öffentlich"
quelle_7="$HOME/Videos"
quelle_8="$HOME/Vorlagen"
quelle_9=""
#
# --- das Standard Ziel für die Ordner hier eintragen -----------------------------------------
#
ziel="$HOME/Backup vom `date +'%m.%y'`"
#
# --- es wurden Ordner übergeben ------------------------------------------------------------
#
if [ "$quelle" ]
  then
  #
  quelle_1="$1"
  quelle_2="$2"
  quelle_3="$3"
  quelle_4="$4"
  quelle_5="$5"
  quelle_6="$6"
  quelle_7="$7"
  quelle_8="$8"
  quelle_9="$9"
  #
  # --- das Standard-Ziel für die übergebenen Ordner hier eintragen ---------------------------
  #
  ziel="$HOME/Backup vom `date +'%m.%y'`"
  #
fi
#
# --- Text für die Datei-Auswahlbox -----------------------------------------------------------
#
alle_quellen="$quelle_1 $quelle_2 $quelle_3 $quelle_4 $quelle_5 $quelle_6 $quelle_7 $quelle_8 $quelle_9"
#
# --- Nach Ziel fragen und dann das Backup von X nach Y starten -------------------------------
#
kdialog --title "Backup mit rsync" --yesnocancel "von Quelle:\n$alle_quellen\n\nnach Ziel:\n$ziel\n\nMit \"Nein\" kann ein anderes Ziel gewählt werden!\n"
#
case $? in
  0) ;;             # es ist nix zu tun, das Standard-Ziel wird benutzt
  1) ziel=`kdialog --title "Ziel für das Backup auswählen" --getexistingdirectory "$HOME" "*"`;;
  2) ziel="";;          # es ist gar nix zu tun, das Backup wurde abgebrochen
esac
#
if [ "$ziel" ]
  then
  #
  le_ordner="$HOME/Backup Infos"
  #
  if [ ! -d "$le_ordner" ]
    then
    mkdir "$le_ordner"
  fi
  #
  while [ "$backup_x" -le "$max_quellen" ]
    do
    #
    case "$backup_x" in
      #
      1) quelle="$quelle_1";;
      2) quelle="$quelle_2";;
      3) quelle="$quelle_3";;
      4) quelle="$quelle_4";;
      5) quelle="$quelle_5";;
      6) quelle="$quelle_6";;
      7) quelle="$quelle_7";;
      8) quelle="$quelle_8";;
      9) quelle="$quelle_9";;
      #
    esac
    backup_x="$((backup_x+1))"
    #
    if [ "$quelle" ]
      then
      quelle_ordner="${quelle##*/}"
      #
      log_datei="$le_ordner/Backup von $quelle_ordner vom `date +'%d.%m.%y - %H:%M:%S'`.txt"
      error_datei="$le_ordner/ERROR bei $quelle_ordner vom `date +'%d.%m.%y - %H:%M:%S'`.txt"
      #
      echo "Backup von $quelle nach $ziel" > "$log_datei"
      echo "" >> "$log_datei"
      #
      (rsync "$para" "$quelle" "$ziel" | tee -a "$log_datei") 2>>"$error_datei"
      #
      if [ -s "$error_datei" ]
        then
        fehler="$fehler$quelle "
      fi
      #
    fi
    #
  done
  #
  if [ "$fehler" ]
    then
    kdialog --title "Fehler beim Backup" --msgbox "von:\n$fehler\n\nnach:\n$ziel\n\nInfos stehen im Ordner \"$le_ordner\" in den \"ERROR bei...\" Dateien.\n"
  else
    kdialog --title "Backup wurde erstellt" --msgbox "von:\n$alle_quellen\n\nnach:\n$ziel\n\nInfos stehen im Ordner \"$le_ordner\" in den \"Backup vom...\" Dateien.\n"
  fi
  #
else
  #
  kdialog --msgbox "Abbruch, durch Benutzer $USER.\n"
  #
fi
#
# --- Skript Ende -----------------------------------------------------------------------------
#
