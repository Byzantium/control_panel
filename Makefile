.EXPORT_ALL_VARIABLES

SHELL = /bin/bash
PRGNAM=example
VERSION=-0.0
## Variables that should be inherited from the parent Makefile or the environment
# MODULEDIR - the directory where finished modules should but stored
# ARCH - from the build environment
# BYZBUILD - Byzantium build version
# MODEXT - module extension (should be '.xzm')
##

# high level targets
.PHONY : build module monolithic clean dist-clean

## example of a preformatted directory tree with
# a '/etc', '/usr', '/home' directories to be installed
install: etc usr home
	$(INSTALL_DIR) $@ $(DESTDIR)

## end example of a preformatted directory tree

## example of a source repo with external configs

# add nonfile targets to the ".PHONY :" line
external-configs: <source files>
	$(INSTALL_DIR) $@ <config destination in $(srcdir) or in $(DESTDIR)>

# make it easier to clean up. Add this as a dependency to the 'clean' target.
external-configs-clean:
	$(CLEAN) <config destination in $(srcdir) or in $(DESTDIR)>

# if they are headed for $(srcdir) you probably want this.
init: external-configs

# if they are headed for $(DESTDIR) you probably want this.
monolithic: external-configs <targets from the built source>

## end example of a source repo with external configs

build: <add individual build targets here>

monolithic: build <add individual install targets here>

module: install <add individual module/premodule targets here>
	dir2xzm $(DESTDIR) $(MODULEDIR)/$(PRGNAM)$(VERSION)-$(ARCH)-$(BYZBUILD).$(MODEXT)

clean: <add individual clean targets here>
	# Do *not* remove $(DESTDIR)! If the build is for a monolithic module that will remove everything from every build.
	$(CLEAN) $@

dist-clean: clean
	$(CLEAN) $(MODULEDIR)/$(PRGNAM)$(VERSION)-$(ARCH)-$(BYZBUILD).$(MODEXT)

