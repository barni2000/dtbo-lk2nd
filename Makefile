DTC := dtc
MKDTBOIMG := mkdtboimg
OUT := build
DTS := $(wildcard *.dts)
DTBO := $(patsubst %.dts,%.dtbo,$(DTS))
DTBO_CONFIG := $(wildcard *.cfg)
DTBO_IMAGE := $(patsubst dtboimg-%.cfg,dtbo-%.img,$(DTBO_CONFIG))

all: $(DTBO) $(DTBO_IMAGE)

clean:
	rm $(OUT)/*.dtbo
	rm $(OUT)/*.img

%.dtbo: %.dts
	mkdir -p $(OUT)
	$(DTC) -O dtb -o $(OUT)/$@ -b 0 -@ $^

dtbo-%.img: dtboimg-%.cfg
	$(MKDTBOIMG) cfg_create $(OUT)/$@ $^
