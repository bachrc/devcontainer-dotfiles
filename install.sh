#!/bin/bash

force_color_prompt=yes

cp ./config/.bash_aliases ~/
echo 'source ~/.bash_aliases' >> ~/.bashrc

bash ./prompt.sh

