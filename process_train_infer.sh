#!/bin/bash

# Define the list of data paths
data_paths=(
    "/home/atasoy/praktikum/data/EXP-1-head/220700191"
    "/home/atasoy/praktikum/data/EXP-1-head/221501007"
    "/home/atasoy/praktikum/data/EXP-1-head/222200036"
    "/home/atasoy/praktikum/data/EXP-1-head/222200037"
    "/home/atasoy/praktikum/data/EXP-1-head/222200038"
    "/home/atasoy/praktikum/data/EXP-1-head/222200039"
    "/home/atasoy/praktikum/data/EXP-1-head/222200040"
    "/home/atasoy/praktikum/data/EXP-1-head/222200041"
    "/home/atasoy/praktikum/data/EXP-1-head/222200042"
    "/home/atasoy/praktikum/data/EXP-1-head/222200043"
    "/home/atasoy/praktikum/data/EXP-1-head/222200044"
    "/home/atasoy/praktikum/data/EXP-1-head/222200045"
    "/home/atasoy/praktikum/data/EXP-1-head/222200046"
    "/home/atasoy/praktikum/data/EXP-1-head/222200047"
    "/home/atasoy/praktikum/data/EXP-1-head/222200048"
    "/home/atasoy/praktikum/data/EXP-1-head/222200049"
    "/home/atasoy/praktikum/data/EXP-1-head/220700191"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/221501007"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200036"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200037"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200038"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200039"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200040"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200041"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200042"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200043"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200044"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200045"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200046"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200047"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200048"
    "/home/atasoy/praktikum/data/EXP-6-tongue-1/222200049"
)

# Iterate over each data path
for path in "${data_paths[@]}"; do
    # Run the preprocessing script
    python preprocessing/main_preprocessing.py --data-path "$path" --config config/preprocessing.yaml &&
    # Run the training script
    python train.py --config config/train.yaml --data-path "$path" && 
    # Run the inference script
    python inference_grid.py --config config/train.yaml --data-path "$path" --use-segm-mask
done

