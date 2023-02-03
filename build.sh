export ZEPHYR_BASE=$HOME/zmk/zephyr
export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
export GNUARMEMB_TOOLCHAIN_PATH=/usr/local/Cellar/arm-gcc-bin@10/10.3-2021.10_1

export BUILD_FOLDER=$(pwd)/build

(cd $HOME/zmk/app &&
  west build -p -d $BUILD_FOLDER/temp/left -b nice_nano_v2 -- -DSHIELD=splitkb_aurora_sweep_left -DZMK_CONFIG=$HOME/projects/zmk-config/config
  west build -p -d $BUILD_FOLDER/temp/right -b nice_nano_v2 -- -DSHIELD=splitkb_aurora_sweep_right -DZMK_CONFIG=$HOME/projects/zmk-config/config
)

if [ -f build/temp/left/zephyr/zmk.uf2 ]
then
  cp build/temp/left/zephyr/zmk.uf2 $BUILD_FOLDER/splitkb_aurora_sweep_left.uf2
fi
if [ -f build/temp/right/zephyr/zmk.uf2 ]
then
  cp build/temp/right/zephyr/zmk.uf2 $BUILD_FOLDER/splitkb_aurora_sweep_right.uf2
fi
rm -rf $BUILD_FOLDER/temp
