all: help

help:
	@echo "  install        to install develo   "
	@echo "  test           to run all tests  "
	@echo "  uninstall      to uninstall develo "

install:
	@echo "Installing ..."
	@echo "Making some dirs in you home ..."
	@echo ''

	@if test -d ~/.develo_project; then \
		echo "~/.develo_project is already exist."; \
	else \
		mkdir -p ~/.develo_project; \
		echo "Add .develo_project dir in ${HOME}"; \
	fi

	@echo "Copy develo scripts and stuff :)"
	@echo "Adding develo.sh to bashrc"
	@cp -R ./* ~/.develo_project/
	@echo '\nsource ~/.develo_project/develo.sh' >> ~/.bashrc


test:
	@echo "TODO"

uninstall:
	@echo "Uninstalling develo"
	@echo ""

	@if test -f ~/.develo_project/develo.sh; then \
		rm -rf ~/.develo_project; \
		sed -ie 's:source ~/.develo_project/develo.sh::g' ~/.bashrc; \
		echo "Develo is uninstalled successful."; \
	else \
		echo "~/.develo_project is not exist."; \
	fi