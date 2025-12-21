DTC := dtc
MKDTBOIMG := mkdtboimg
OUT := build
DTBO_CONFIG := $(wildcard *.cfg)
DTBO_IMAGE := $(patsubst dtboimg-%.cfg,$(OUT)/dtbo-%.img,$(DTBO_CONFIG))

all: $(DTBO_IMAGE)

.PHONY: clean
clean:
	-rm $(OUT)/**/*.dtbo $(OUT)/*.dtbo $(OUT)/*.img
	-rmdir $(OUT)/*

$(OUT)/%.dtbo: %.dts
	mkdir -p $(dir $@)
	$(DTC) -O dtb -o $@ -b 0 -@ $^

$(OUT)/dtbo-%.img: dtboimg-%.cfg
	$(MKDTBOIMG) cfg_create $@ $<

# Add .cfg->.dtbo dependencies by parsing the actual .cfg files
$(foreach dtbo,$(DTBO_IMAGE),\
	$(eval $(dtbo): $(patsubst %.dtbo,$(OUT)/%.dtbo,$(filter %.dtbo,$(file <$(patsubst $(OUT)/dtbo-%.img,dtboimg-%.cfg,$(dtbo)))))))
