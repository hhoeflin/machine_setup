.PHONY: clean


00_rocky8_base.sif: 00_rocky8_base.def 00_bashrc.sh
	sudo apptainer build --force 00_rocky8_base.sif 00_rocky8_base.def

10_homebrew_opt.sif: 10_homebrew_template.def 00_rocky8_base.sif
	sed -e "s|__HOMEBREW_PREFIX__|/opt/homebrew|g" 10_homebrew_template.def > 10_homebrew_opt.def
	sudo apptainer build --force 10_homebrew_opt.sif 10_homebrew_opt.def

10_homebrew_home.sif: 10_homebrew_template.def 00_rocky8_base.sif
	sed -e "s|__HOMEBREW_PREFIX__|${HOME}/.homebrew|g" 10_homebrew_template.def > 10_homebrew_home.def
	sudo apptainer build --force 10_homebrew_home.sif 10_homebrew_home.def

20_brew_install_node.sif: 20_brew_install_node_template.def 10_homebrew_opt.sif
	sed -e "s|__BASE_IMAGE__|10_homebrew_opt.sif|g" 20_brew_install_node_template.def > 20_brew_install_node.def
	sudo apptainer build --force 20_brew_install_node.sif 20_brew_install_node.def

clean:
	rm 10_homebrew_opt.def
	rm 10_homebrew_home.def
