#!/bin/bash
#
#SBATCH --gres=gpu:2
#SBATCH --cpus-per-task=12
#SBATCH -J blurry_train_deepcluster_elephantcat_alexnet_ImageNet
#SBATCH --output=/home/ainedineen/blurry_vision/blurry_vision_deepcluster/deepcluster_alexnet_ImageNet/logs/slurm-%j.out
#SBATCH --error=/home/ainedineen/blurry_vision/blurry_vision_deepcluster/deepcluster_alexnet_ImageNet/logs/slurm-%j.err

DIR="/data/ILSVRC2012/train" 
ARCH="alexnet"
LR=0.05
WD=-5
K=10000
WORKERS=12
EXP="/home/ainedineen/blurry_vision/blurry_vision_deepcluster/deepcluster_alexnet_ImageNet/test/outmodel_deepcluster_alexnet_ImageNet"
PYTHON="/opt/anaconda3/envs/blurry_vision/bin/python"


${PYTHON} main.py ${DIR} --exp ${EXP} --arch ${ARCH} \
  --lr ${LR} --wd ${WD} --k ${K} --sobel --verbose --workers ${WORKERS}
