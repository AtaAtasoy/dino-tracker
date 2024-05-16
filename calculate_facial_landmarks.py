from tqdm import tqdm
import face_alignment
import os
import argparse
import numpy as np

def run(args):
    data_path = args.data_path
    #print(f"Data_path : {data_path}")
    experiments = [experiment for experiment in os.listdir(data_path) if experiment.startswith("EXP")]
    #print(f"Experiments: {experiments}")
    camera_angles = [angle for angle in os.listdir(os.path.join(data_path, experiments[0])) if angle.startswith("22")]
    #print(f"Camera_angles: {camera_angles}")

    fa = face_alignment.FaceAlignment(face_alignment.LandmarksType.TWO_D, device='cuda', flip_input=False)

    experiments = []

    for experiment in tqdm(experiments):
        for camera in tqdm(camera_angles):
            current_path = os.path.join(data_path, experiment, camera)
            landmarks_path = os.path.join(current_path, "facial_landmarks.npy")
            
            predictions = fa.get_landmarks_from_directory(current_path, return_bboxes=True, return_landmark_score=True)
            np.save(landmarks_path, predictions)
        
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-path", default="dataset", type=str)
    args = parser.parse_args()
    run(args)