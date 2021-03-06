#!/bin/bash

# TRAINING_SET is expected to be exported before invoking this script.
#TRAINING_SET=~/projects/BOEL-KK-2013-2015/src/pisvm-datasets/classification/mnist_train_576_rbf_8vr.500.dat

# The time program gives better info than the builtin time command.
TIME=`which time`

BASE=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

# Train the classifiers

echo;
echo "Training libsvm ICC."
$TIME $BASE/jcp_train.sh -c 0 -m mnist_576_rbf_8vr.icc.libsvmmodel $TRAINING_SET 

echo;
echo "Training jlibsvm ICC."
$TIME $BASE/jcp_train.sh -c 1 -m mnist_576_rbf_8vr.icc.jlibsvmmodel $TRAINING_SET

echo;
echo "Training jliblinear ICC."
$TIME $BASE/jcp_train.sh -c 2 -m mnist_576_rbf_8vr.icc.jliblinearmodel $TRAINING_SET

echo;
echo "Training OpenCV SVM ICC."
$TIME $BASE/jcp_train.sh -c 3 -m mnist_576_rbf_8vr.icc.ocvsvmmodel $TRAINING_SET

echo;
echo "Training OpenCV RF ICC."
$TIME $BASE/jcp_train.sh -c 4 -m mnist_576_rbf_8vr.icc.ocvrfmodel $TRAINING_SET
