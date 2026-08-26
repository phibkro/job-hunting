# job-hunting build commands — run inside the dev shell (direnv / nix develop)

# list recipes
default:
    @just --list

# compile one document: just build cv-rema
build name:
    mkdir -p dist
    typst compile src/{{name}}.typ dist/{{name}}.pdf

# compile every src/*.typ into dist/ (skips _lib-style shared files)
build-all:
    mkdir -p dist
    for f in src/*.typ; do \
        name=$(basename "$f" .typ); \
        case "$name" in _*) continue;; esac; \
        echo "→ $name"; \
        typst compile "$f" "dist/$name.pdf"; \
    done

# live-recompile while editing: just watch cover-rema
watch name:
    mkdir -p dist
    typst watch src/{{name}}.typ dist/{{name}}.pdf

# start a new cover letter from an existing one: just new-cover acme cover-rema
new-cover company template="cover-rema":
    cp src/{{template}}.typ src/cover-{{company}}.typ
    @echo "created src/cover-{{company}}.typ (from {{template}})"

# poll NAV feed for new Oslo IT-support listings: just poll [--since 2026-07-08] [--dry]
poll *args:
    python3 scripts/poll_nav.py {{args}}

# watch finn.no for new Oslo listings: just finn -q utvikler [--fetch-new] [--dry]
finn *args:
    python3 scripts/finn_watch.py {{args}}

# remove generated outputs
clean:
    rm -rf dist

# build application stack PDF(s): just stack [slug ...]  (all listings by default)
stack *args:
    python3 scripts/gen_stack.py {{args}}
