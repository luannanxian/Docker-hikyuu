#!/usr/bin/bash

sed -i "s/^#font.family.*$/font.family:   WenQuanYi Zen Hei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif/" /usr/local/lib/python3.12/dist-packages/matplotlib/mpl-data/matplotlibrc
sed -i "s/^#font.sans-serif.*$/font.sans-serif:  WenQuanYi Zen Hei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif/" /usr/local/lib/python3.12/dist-packages/matplotlib/mpl-data/matplotlibrc
