PROJECT = code

prefix ?= /usr/local

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

prog: # ...
   # ...

.PHONY: run
run : prog
	@bang run $(PROJECT) $(RUN_ARGS)
test:
	bang test

install: install-$(PROJECT)

install-$(PROJECT):
	-mkdir -p $(prefix)/bin
	ln -s `pwd`/exec $(prefix)/bin/$(PROJECT)

clean:
	@-rm -rf $(prefix)/bin/$(PROJECT)
