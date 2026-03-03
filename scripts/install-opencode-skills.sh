#!/usr/bin/env bash
# install-opencode-skills.sh
# Clone latest Anthropic skills and install selected ones to opencode

set -euo pipefail

REPO_URL="https://github.com/anthropics/skills"
CACHE_DIR="${HOME}/.cache/anthropic-skills"
OPENCODE_SKILLS_DIR="${HOME}/.config/opencode/skills/anthropic"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# Extract a field from SKILL.md YAML frontmatter
get_skill_field() {
    local skill_dir="$1"
    local field="$2"
    local skill_file="${skill_dir}/SKILL.md"
    [ -f "${skill_file}" ] || return 0
    # Extract value between first pair of --- delimiters
    awk "
        /^---/ { if (++count == 2) exit }
        count == 1 && /^${field}:/ {
            sub(/^${field}:[[:space:]]*/, \"\")
            # Strip surrounding quotes if present
            gsub(/^\"|\"$/, \"\")
            print
            exit
        }
    " "${skill_file}"
}

# Truncate string to max length
truncate_str() {
    local str="$1"
    local max="$2"
    if [ ${#str} -gt "${max}" ]; then
        echo "${str:0:$((max-3))}..."
    else
        echo "${str}"
    fi
}

# Check if a skill is already installed
is_installed() {
    local skill="$1"
    [ -d "${OPENCODE_SKILLS_DIR}/${skill}" ]
}

fetch_skills() {
    echo -e "${BLUE}${BOLD}Fetching latest skills...${RESET}"
    if [ -d "${CACHE_DIR}/.git" ]; then
        echo -e "  ${DIM}Updating cache at ${CACHE_DIR}${RESET}"
        git -C "${CACHE_DIR}" pull --quiet 2>&1 | sed 's/^/  /'
    else
        echo -e "  ${DIM}Cloning ${REPO_URL}${RESET}"
        git clone --quiet "${REPO_URL}" "${CACHE_DIR}"
    fi
    echo -e "  ${GREEN}Done.${RESET}\n"
}

# Multi-select menu
# Prints selected skill names (one per line) to stdout
# All UI output goes to stderr (for interactive display)
multi_select() {
    local -a options=("$@")
    local -a descriptions=()
    local n=${#options[@]}
    local -a selected=()

    # Gather descriptions and pre-select installed skills
    for ((i = 0; i < n; i++)); do
        local skill="${options[i]}"
        local desc
        desc=$(get_skill_field "${CACHE_DIR}/skills/${skill}" "description")
        desc=$(truncate_str "${desc}" 70)
        descriptions[i]="${desc}"
        if is_installed "${skill}"; then
            selected[i]=1
        else
            selected[i]=0
        fi
    done

    local term_width
    term_width=$(tput cols 2>/dev/null || echo 80)

    while true; do
        # Clear screen and redraw
        clear >&2

        echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${RESET}" >&2
        echo -e "${BOLD}${BLUE}║   OpenCode Skills Installer              ║${RESET}" >&2
        echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${RESET}" >&2
        echo >&2
        echo -e "  ${DIM}Enter a number to toggle | ${CYAN}a${RESET}${DIM} = select all | ${CYAN}n${RESET}${DIM} = clear all | ${CYAN}q${RESET}${DIM} = install${RESET}" >&2
        echo >&2

        local selected_count=0
        for ((i = 0; i < n; i++)); do
            [ "${selected[i]}" -eq 1 ] && ((selected_count++)) || true
        done

        for ((i = 0; i < n; i++)); do
            local skill="${options[i]}"
            local installed_tag=""
            is_installed "${skill}" && installed_tag=" ${CYAN}(installed)${RESET}"

            if [ "${selected[i]}" -eq 1 ]; then
                printf "  ${GREEN}[✓]${RESET} ${BOLD}%2d. %-20s${RESET}${DIM} %s${RESET}%b\n" \
                    "$((i + 1))" "${skill}" "${descriptions[i]}" "${installed_tag}" >&2
            else
                printf "  ${RED}[ ]${RESET} %2d. ${DIM}%-20s  %s${RESET}%b\n" \
                    "$((i + 1))" "${skill}" "${descriptions[i]}" "${installed_tag}" >&2
            fi
        done

        echo >&2
        echo -e "  Selected: ${BOLD}${selected_count}${RESET} / ${n}" >&2
        echo >&2

        local choice
        read -rp $'  \033[1;33m>\033[0m ' choice >&2 </dev/tty

        case "${choice}" in
            q | Q | "")
                break
                ;;
            a | A)
                for ((i = 0; i < n; i++)); do selected[i]=1; done
                ;;
            n | N)
                for ((i = 0; i < n; i++)); do selected[i]=0; done
                ;;
            *)
                if [[ "${choice}" =~ ^[0-9]+$ ]] && \
                   [ "${choice}" -ge 1 ] && \
                   [ "${choice}" -le "${n}" ]; then
                    local idx=$((choice - 1))
                    if [ "${selected[idx]}" -eq 1 ]; then
                        selected[idx]=0
                    else
                        selected[idx]=1
                    fi
                else
                    echo -e "  ${RED}Invalid: enter 1-${n}, 'a', 'n', or 'q'${RESET}" >&2
                    sleep 0.8
                fi
                ;;
        esac
    done

    # Output only selected skill names to stdout
    for ((i = 0; i < n; i++)); do
        [ "${selected[i]}" -eq 1 ] && echo "${options[i]}"
    done
}

install_skills() {
    local -a skills=("$@")
    mkdir -p "${OPENCODE_SKILLS_DIR}"

    for skill in "${skills[@]}"; do
        local src="${CACHE_DIR}/skills/${skill}"
        local dst="${OPENCODE_SKILLS_DIR}/${skill}"

        if [ -d "${dst}" ]; then
            echo -e "  ${YELLOW}↺${RESET} Updating ${BOLD}${skill}${RESET}"
            rm -rf "${dst}"
        else
            echo -e "  ${GREEN}+${RESET} Installing ${BOLD}${skill}${RESET}"
        fi

        cp -r "${src}" "${dst}"
        echo -e "    ${DIM}→ ${dst}${RESET}"
    done
}

main() {
    clear
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}${BLUE}║   OpenCode Skills Installer              ║${RESET}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${RESET}"
    echo

    fetch_skills

    # Collect available skills (dirs with SKILL.md)
    local -a available=()
    for dir in "${CACHE_DIR}/skills"/*/; do
        if [ -f "${dir}SKILL.md" ]; then
            available+=("$(basename "${dir}")")
        fi
    done

    if [ ${#available[@]} -eq 0 ]; then
        echo -e "${RED}No skills found in repository.${RESET}"
        exit 1
    fi

    # Interactive selection (chosen comes from stdout of multi_select)
    local -a chosen=()
    while IFS= read -r line; do
        chosen+=("${line}")
    done < <(multi_select "${available[@]}")

    clear
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}${BLUE}║   OpenCode Skills Installer              ║${RESET}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${RESET}"
    echo

    if [ ${#chosen[@]} -eq 0 ]; then
        echo -e "${YELLOW}No skills selected. Nothing to install.${RESET}"
        exit 0
    fi

    echo -e "${BOLD}Installing ${#chosen[@]} skill(s):${RESET}\n"
    install_skills "${chosen[@]}"

    echo
    echo -e "${GREEN}${BOLD}✓ Done!${RESET} Skills installed to:"
    echo -e "  ${CYAN}${OPENCODE_SKILLS_DIR}${RESET}"
    echo
    echo -e "${DIM}Restart opencode to use the new skills.${RESET}"
}

main "$@"
