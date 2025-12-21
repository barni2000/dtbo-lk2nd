DTC := dtc
MKDTBOIMG := mkdtboimg
OUT := build
DTS := $(wildcard *.dts **/*.dts)
DTBO := $(patsubst %.dts,$(OUT)/%.dtbo,$(DTS))
DTBO_CONFIG := $(wildcard *.cfg)
DTBO_IMAGE := $(patsubst dtboimg-%.cfg,$(OUT)/dtbo-%.img,$(DTBO_CONFIG))

all: $(DTBO) $(DTBO_IMAGE)

.PHONY: clean
clean:
	rm $(OUT)/**/*.dtbo $(OUT)/*.dtbo
	rm $(OUT)/*.img
	rmdir $(OUT)/*

$(OUT)/%.dtbo: %.dts
	mkdir -p $(dir $@)
	$(DTC) -O dtb -o $@ -b 0 -@ $^

$(OUT)/dtbo-%.img: dtboimg-%.cfg
	$(MKDTBOIMG) cfg_create $@ $^
