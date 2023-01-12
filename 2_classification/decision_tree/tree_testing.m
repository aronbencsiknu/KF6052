clc;

folder_test=dir('test_images\');
Number_test_images=length(folder_test)-2; % number of test images

test_set = [];
ground_truth = [];

% load images into test_set
for i=1:Number_test_images
    Image=imread(['test_images\' folder_test(i+2).name]);
    test_set=[test_set;get_featureVector(Image)'];
    if folder_test(i+2).name(1)=="t"
        ground_truth(i)=1;
    else
        ground_truth(i)=0;
    end
end

%test_set = test_set';
predicted = predict(trained_model, test_set);
predicted = predicted';

% generate true positive, false positive, true negative and false negative
% values
[tp,fp,tn,fn] = cf_mat(ground_truth, predicted);

fpr = fp / (fp + tn); % false positive rate
fnr = fn/(fn + tp); % false negative rate
error = (fpr + fnr) / 2; % error

disp(strcat("False Positive Rate: ", sprintf('%.3f',fpr)));
disp(strcat("False Negative Rate: ", sprintf('%.3f',fnr)));
disp(strcat("Error: ",sprintf('%.3f',error)));
