#If KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq ($(KERNELRELEASE),)
	obj-m := pktgen.o
# Otherwise we were called directly from the command
# line; invoke the kernel build system.
else

	#KERNELDIR ?= /lib/modules/3.6.0-rc2+/build
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules 

clean:
	rm -rf pktgen.o pktgen.mod.o pktgen.ko pktgen.mod.c Module.symvers modules.order .pktgen.ko.cmd .pktgen.mod.o.cmd .pktgen.o.cmd .tmp_versions
endif
