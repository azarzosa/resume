TEX_FILE := resume.tex
PDF_FILE := resume.pdf

.PHONY: all check-tools pdf lint clean

all: pdf

check-tools:
	@command -v latexmk >/dev/null || { echo "latexmk not found. Install MacTeX, then restart your terminal/VS Code." >&2; exit 1; }

pdf: check-tools
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(TEX_FILE)

lint:
	@command -v chktex >/dev/null || { echo "chktex not found. Install MacTeX (the command is chktex, not chtex)." >&2; exit 1; }
	chktex -q $(TEX_FILE)

clean:
	latexmk -c $(TEX_FILE)
