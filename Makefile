#!/usr/bin/make -f -j9
PROG_NAME = NeteXt73
OPT_DIR = /opt
PREFIX = /usr
BINDIR = /bin
datarootdir = $(PREFIX)/share
MOVE_COMMAND = mv
MKDIR = mkdir
INSTALL = install -m
APM_DIR = APM
APM_FILES = $(wildcard $(APM_DIR)/*)
DESKTOPFILES_DIR = desktopfiles
DESKTOPFILES_FILES=$(wildcard $(DESKTOPFILES_DIR)/*.desktop)
GRAPHIC_KERNEL_DIR = kernel
GRAPHIC_KERNEL_FILES = $(wildcard $(GRAPHIC_KERNEL_DIR)/*.desktop)
GRAPHIC_KERNEL_PREMIUM_DIR = kernel-premium
GRAPHIC_KERNEL_PREMIUM_FILES = $(wildcard $(GRAPHIC_KERNEL_PREMIUM_DIR)/*.desktop)
GRAPHIC_BASE_DIR = ikony
GRAPHIC_BASE_FILES = $(wildcard $(GRAPHIC_BASE_DIR)/*.png)
CONTACTS_DIR = kontakty
CONTACTS_FILES = $(wildcard $(CONTACTS_DIR)/*.desktop)
MENU_DIR = menu
MENU_FILES = $(wildcard $(MENU_DIR)/*)
TRANSLATIONS_DIR = tlumaczenia
make: nothing_to_make
nothing_to_make:
	
	@echo -e '\033[1;32mNie będę budował NeteXt73 :)...\033[0m'
		
make_yad_netext:
	
	@echo -e '\033[1;32mBuild Yad-netext...\033[0m'
	$(MAKE) -C yad-netext
	
install: install_desktopfiles \
	 install_desktopicons \
	 install_desktopfiles_kernel \
	 install_desktopfiles_kernel_premium \
	 install_contacts \
	 install_menu \
	 install_translations_files \
	 install_bash_files \
	 install_yad_netext \
	 install_APM \
	 install_launcher \
	 install_file_LICENSE \
	 install_file_NeteXt73 \
	 install_file_NeteXt73_root \
	 install_file_apm \
	 install_file_changelog \
	 install_file_config \
	 install_file_deinstalator \
	 install_file_grub \
	 install_file_help \
	 install_file_kernele \
	 install_file_kontakt \
	 install_file_logi \
	 install_file_microcode \
	 install_file_monitor \
	 install_file_grafiki \
	 install_file_procedury \
	 install_file_ram \
	 install_file_repo \
	 install_file_skrypty \
	 install_file_paypal \
	 install_file_update \
	 install_file_uslugi 
	 
	 $(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
clean:
	
	if test -f "yad-netext/Makefile" ; then $(MAKE) -C yad-netext distclean ; fi
	
install_yad_netext:
	
	$(MAKE) -C yad-netext install
	
install_desktopfiles:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(DESKTOPFILES_DIR)/
	$(INSTALL) 0755 $(DESKTOPFILES_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(DESKTOPFILES_DIR)/
	
install_desktopicons:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_BASE_DIR)/
	$(INSTALL) 0755 $(GRAPHIC_BASE_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_BASE_DIR)
	
install_APM:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(APM_DIR)/
	$(INSTALL) 0755 $(APM_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(APM_DIR)
	
install_desktopfiles_kernel:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_DIR)/
	$(INSTALL) 0755 $(GRAPHIC_KERNEL_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_DIR)

install_desktopfiles_kernel_premium:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_PREMIUM_DIR)/
	$(INSTALL) 0755 $(GRAPHIC_KERNEL_PREMIUM_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_PREMIUM_DIR)

install_contacts:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(CONTACTS_DIR)/
	$(INSTALL) 0755 $(CONTACTS_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(CONTACTS_DIR)
	
install_menu:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(MENU_DIR)/
	$(MKDIR) -p ${DESTDIR}${datarootdir}/pixmaps
	$(MKDIR) -p $(DESTDIR)$(datarootdir)/applications/
	$(INSTALL) 0755 $(MENU_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(MENU_DIR)
	$(INSTALL) 0644 $(MENU_DIR)/NeteXt73.png $(DESTDIR)$(datarootdir)/pixmaps
	$(INSTALL) 0755 $(MENU_DIR)/NeteXt73.desktop $(DESTDIR)$(datarootdir)/applications
	
install_translations_files:
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(TRANSLATIONS_DIR)/
	$(INSTALL) 0755 $(TRANSLATIONS_DIR)/* $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(TRANSLATIONS_DIR)
	
install_launcher:
	$(MKDIR) -p $(DESTDIR)$(PREFIX)$(BINDIR)
	$(INSTALL) 0755 $(MENU_DIR)/netext73 $(DESTDIR)$(PREFIX)$(BINDIR)
	
install_file_LICENSE:
	$(INSTALL) 0755 LICENSE $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_NeteXt73:	
	$(INSTALL) 0755 NeteXt73 $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_NeteXt73_root:	
	$(INSTALL) 0755 NeteXt73_root $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_apm:	
	$(INSTALL) 0755 apm $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/
install_file_changelog:	
	$(INSTALL) 0755 changelog $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_config:	
	$(INSTALL) 0755 config $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_deinstalator:	
	$(INSTALL) 0755 deinstalator $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_grub:	
	$(INSTALL) 0755 grub $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_help:	
	$(INSTALL) 0755 help $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_kernele:	
	$(INSTALL) 0755 kernele $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_kontakt:
	$(INSTALL) 0755 kontakt $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_logi:	
	$(INSTALL) 0755 logi $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_microcode:	
	$(INSTALL) 0755 microcode $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_monitor:	
	$(INSTALL) 0755 monitor $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_grafiki:	
	$(INSTALL) 0755 grafiki $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_procedury:	
	$(INSTALL) 0755 procedury $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_ram:	
	$(INSTALL) 0755 ram $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_repo:	
	$(INSTALL) 0755 repo $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_skrypty:	
	$(INSTALL) 0755 skrypty $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_paypal:	
	$(INSTALL) 0755 paypal $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_update:
	$(INSTALL) 0755 update $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
install_file_uslugi:	
	$(INSTALL) 0755 uslugi $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	
	