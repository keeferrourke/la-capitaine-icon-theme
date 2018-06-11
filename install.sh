#!/bin/bash
#set -ueo pipefail
#set -x

REPO_DIR=$(cd $(dirname $0) && pwd)

DEST_DIR=/usr/share/icons
THEME_NAME=La-Capitaine
THEME_DIR=${DEST_DIR}/${THEME_NAME}


echo  "Customize '${THEME_DIR}'..."
  ./configure

usage() {
  printf "%s\n" "Usage: $0 [OPTIONS...]"
  printf "\n%s\n" "OPTIONS:"
  printf "  %-25s%s\n" "-d, --dest DIR" "Specify theme destination directory (Default: ${DEST_DIR})"
  printf "  %-25s%s\n" "-n, --name NAME" "Specify theme name (Default: ${THEME_NAME})"
  printf "  %-25s%s\n" "-h, --help" "Show this help"
  printf "\n%s\n" "INSTALLATION EXAMPLES:"
  printf "%s\n" "Install all theme variants into ~/.icons"
  printf "  %s\n" "$0 --dest ~/.icons"
}

install() {
  local dest=${1}
  local name=${2}

  local THEME_DIR=${dest}/${name}

  [[ -d ${THEME_DIR} ]] && rm -rf ${THEME_DIR}

  echo "Installing '${THEME_DIR}'..."

  mkdir -p  ${THEME_DIR}
  cp -r ${REPO_DIR}/configure ${THEME_DIR}
  cp -r ${REPO_DIR}/COPYING ${THEME_DIR}
  cp -r ${REPO_DIR}/index.theme ${THEME_DIR}
  cp -r ${REPO_DIR}/LICENSE ${THEME_DIR}
  cp -r ${REPO_DIR}/actions ${THEME_DIR}/actions
  cp -r ${REPO_DIR}/animations  ${THEME_DIR}/animations
  cp -r ${REPO_DIR}/apps  ${THEME_DIR}/apps
  cp -r ${REPO_DIR}/devices ${THEME_DIR}/devices
  cp -r ${REPO_DIR}/emblems ${THEME_DIR}/emblems
  cp -r ${REPO_DIR}/emotes  ${THEME_DIR}/emotes
  cp -r ${REPO_DIR}/mimetypes ${THEME_DIR}/mimetypes
  cp -r ${REPO_DIR}/panel ${THEME_DIR}/panel
  cp -r ${REPO_DIR}/places  ${THEME_DIR}/places
  cp -r ${REPO_DIR}/status  ${THEME_DIR}/status
  case `lsb_release -cs` in
    artful|bionic|cosmic)
    echo "Updating icon cache..."
    gtk-update-icon-cache -qtf $THEME_DIR/
    ;;
    xenial)
    echo "Updating icon cache NOT supported..."
    ;;
    *)
    ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "${1}" in
    -d|--dest)
      dest="${2}"
      if [[ ! -d "${dest}" ]]; then
        echo "ERROR: Destination directory does not exist."
        exit 1
      fi
      shift 2
      ;;
    -n|--name)
      name="${2}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: Unrecognized installation option '$1'."
      echo "Try '$0 --help' for more information."
      exit 1
      ;;
  esac
done

if [[ ! -w "${dest:-${DEST_DIR}}" ]]; then
  echo "Please run as root."
  exit 1
fi

install "${dest:-${DEST_DIR}}" "${name:-${THEME_NAME}}"
