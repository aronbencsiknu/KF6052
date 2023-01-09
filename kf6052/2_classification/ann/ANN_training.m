clear;
folder_text=dir('text\');
folder_non_text=dir('non_text\');
Number_text_images=length(folder_text)-2; % number of text images
Number_non_text_images=length(folder_non_text)-2; % number of non text images
input_training_set=[];

% Construct the training set 
% each training feature vector (either for text or non text images) is extracted 

for i=1:Number_text_images,
    Image=imread(['text\' folder_text(i+2).name]);
    input_training_set=[input_training_set;get_featureVector(Image)'];   
    output_training_set{i,1}='text';
end
k=i;
for i=1:Number_non_text_images,
    Image=imread(['non_text\' folder_non_text(i+2).name]);
    [row,column]=size(Image);
    input_training_set=[input_training_set;get_featureVector(Image)'];
    output_training_set{k+i,1}='non text';
   
end
% because we have 88 training samples, the input_training_set should be
% arranged in a matrix of 49 rows and 88 columns to train the network.
% Remember that this arrangement should be the other way around (49 columns and 88 rows)
% for the Bayes and Tree classifiers
input_training_set=input_training_set'; % get the right arrangement for the input set. 
output_training_set=output_training_set'; % get the right arrangement for the output set


Target=strcmp('text',output_training_set); % Now, Target has logical values (0 and 1). This has to be converted into double.


rng('default'); % set the random number generator to its default state
rng(44); % this is an integer value to initialise the random number generator

net = feedforwardnet([20 5]); % create a network for non-linear classification, 20  neurons in first hidden layer 
% and 5 in the second.
net.layers{1}.transferFcn='tansig';  % transfer function for the neurons in first hidden layer is tangent sigmoid.
net.layers{2}.transferFcn='tansig';  % transfer function for the neurons in second hidden layer is tangent sigmoid.
net.layers{3}.transferFcn='purelin';  % transfer function for the neurons in the output layer is linear.
net.trainParam.epochs = 40;  % set to 40 the maximum number of times the training samples will be used to train the network
net = train(net,input_training_set,double(Target)); % train the network with the training samples.


    
