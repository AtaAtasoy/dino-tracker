import argparse
from tqdm import tqdm
import os
from data.data_utils import generate_benchmark_data
from metrics import compute_metrics_for_custom_dataset

def eval_dataset(args):
    benchmark_data = generate_benchmark_data(args.data_path, args.experiment_name)
    compute_metrics_for_custom_dataset(benchmark_data)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-path", default="", type=str)
    parser.add_argument("--experiment-name", default="", type=str)
    args = parser.parse_args()
    eval_dataset(args)