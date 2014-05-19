#!/usr/bin/make -f
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
	
install: create_directories \
	 install_desktopfiles \
	 install_desktopicons \
	 install_desktopfiles_kernel \
	 install_desktopfiles_kernel_premium \
	 install_contacts \
	 install_menu \
	 install_translations_files \
	 install_bash_files \
	 install_yad_netext \
	 install_APM \
	 install_launcher
clean:
	
	if test -f "yad-netext/Makefile" ; then $(MAKE) -C yad-netext distclean ; fi
	
install_yad_netext:
	
	$(MAKE) -C yad-netext install
	
create_directories:
	
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(DESKTOPFILES_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_BASE_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_PREMIUM_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(CONTACTS_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(TRANSLATIONS_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(MENU_DIR)/
	$(MKDIR) -p $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(APM_DIR)/
	$(MKDIR) -p ${DESTDIR}${datarootdir}/pixmaps
	$(MKDIR) -p $(DESTDIR)$(datarootdir)/applications/
	$(MKDIR) -p $(DESTDIR)$(PREFIX)$(BINDIR)
	
install_desktopfiles:
	
	$(INSTALL) 0755 $(DESKTOPFILES_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(DESKTOPFILES_DIR)/
	
install_desktopicons:
	
	$(INSTALL) 0755 $(GRAPHIC_BASE_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_BASE_DIR)
	
install_APM:
	
	$(INSTALL) 0755 $(APM_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(APM_DIR)
	
install_desktopfiles_kernel:
	
	$(INSTALL) 0755 $(GRAPHIC_KERNEL_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_DIR)

install_desktopfiles_kernel_premium:

	$(INSTALL) 0755 $(GRAPHIC_KERNEL_PREMIUM_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(GRAPHIC_KERNEL_PREMIUM_DIR)

install_contacts:
	
	$(INSTALL) 0755 $(CONTACTS_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(CONTACTS_DIR)
	
install_menu:
	
	$(INSTALL) 0755 $(MENU_FILES) $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(MENU_DIR)
	$(INSTALL) 0644 $(MENU_DIR)/NeteXt73.png $(DESTDIR)$(datarootdir)/pixmaps
	$(INSTALL) 0755 $(MENU_DIR)/NeteXt73.desktop $(DESTDIR)$(datarootdir)/applications
	
install_translations_files:
	
	$(INSTALL) 0755 $(TRANSLATIONS_DIR)/* $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/$(TRANSLATIONS_DIR)
	
install_launcher:
	
	$(INSTALL) 0755 $(MENU_DIR)/netext73 $(DESTDIR)$(PREFIX)$(BINDIR)
	
install_bash_files:
	
	$(INSTALL) 0755 LICENSE $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 NeteXt73 $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 NeteXt73_root $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 apm $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)/
	$(INSTALL) 0755 changelog $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 config $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 deinstalator $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 grub $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 help $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 kernele $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 kontakt $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 logi $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 microcode $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 monitor $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 grafiki $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 procedury $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 ram $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 repo $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 skrypty $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 paypal $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 update $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	$(INSTALL) 0755 uslugi $(DESTDIR)$(OPT_DIR)/$(PROG_NAME)
	
	