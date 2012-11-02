LUA= $(shell echo `which lua`)
LUA_BINDIR= $(shell echo `dirname $(LUA)`)
LUA_PREFIX= $(shell echo `dirname $(LUA_BINDIR)`)
LUA_SHAREDIR=$(LUA_PREFIX)/share/lua/5.1

ldoc:

install: install_parts
	echo "lua $(LUA_SHAREDIR)/ldoc.lua \$$*" > $(LUA_BINDIR)/ldoc
	chmod +x $(LUA_BINDIR)/ldoc

install_luajit: install_parts
	echo "luajit $(LUA_SHAREDIR)/ldoc.lua \$$*" > $(LUA_BINDIR)/ldoc
	chmod +x $(LUA_BINDIR)/ldoc

install_parts:
	mkdir -p $(LUA_SHAREDIR)
	cp ldoc.lua $(LUA_SHAREDIR)
	cp -r ldoc $(LUA_SHAREDIR)

uninstall: 
	-rm $(LUA_SHAREDIR)/ldoc.lua
	-rm -r $(LUA_SHAREDIR)/ldoc
	-rm $(LUA_BINDIR)/ldoc