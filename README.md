# Handwritten number classification using Radial-Basis Function Network

### Synopsis ###
This project took place during the module _Neural networks_ at NUS (EE5904R).
The goal of this project is to classify handwritten digits from MNIST dataset by using a Radial-Basis Function Network. In order to reduce the number of output categories, only digits 1 and 8 are concerned by the classification.

### Results ###


### Project content ###

Content of this project: 

* 'init.m': Matlab script to initialize the program (load the dataset 'MNIST_dataset.mat' into the Matlab workspace) 
* 'rbfn_standard.m': Matlab script to train a RBFN to classify the digits (with two ways of choising the centers of the RBFN)
* 'rbfn_regularization.m':  Matlab script to train a RBFN to classify the digits with regularization
* 'rbfn_tuning_std.m': Matlab script to try different values for the standard deviation that appears in the RBF
* other Matlab files ('.m' extension): Matlab functions and scripts to run the program

To make the program run: 

1. run _init_
2. run one of the Matlab scripts _rbfn_standard_ / rbfn_regularization_ 

### Author ###

Mareva Brixy (marevabrixy@gmail.com)
