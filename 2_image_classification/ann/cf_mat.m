function [tp,fp,tn,fn] = cf_mat(ground_truth, predicted)
    tp = 0;
    fp = 0;
    tn = 0;
    fn = 0;
    for index = 1:size(ground_truth,2)
        if ground_truth(index) == 1 && predicted(index) == 1
            tp = tp + 1;
        elseif ground_truth(index) == 0 && predicted(index) == 1
            fp = fp + 1;
        elseif ground_truth(index) == 0 && predicted (index)== 0
            tn = tn + 1;
        else
            fn = fn + 1;
        end

    end
end

