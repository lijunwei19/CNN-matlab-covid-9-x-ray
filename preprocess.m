%%
close all
clear all

%% initialize
res_features = [];
res_labels = [];

net = vgg16();

%% get all pics (.jpg, .jpeg, .png)
path ='D:\OneDrive\EC503 learning from data\final project\final_project\total_image\test';     % change to your path
file_type = ["/*.jpg", "/*.png", "/*.jpeg"];
folders = ["/normal","/covid"];
labels = [-1, 1];                                                % covid as 1, normal as 0
for f=1:2
    folder_path = path + folders(f);
    for t=1:length(file_type)
        filepath = folder_path + file_type(t);
        srcFiles = dir(filepath);
        for i=1:length(srcFiles)
           filename = strcat(folder_path, '/',srcFiles(i).name);
           disp(filename);
           img = imread(filename);  
           if(length(size(img))) == 2
               img = cat(3, img, img, img);
           end
           img_std = imresize(img, [224,224]);                  % resize to fit vgg16
            
           features = activations(net, img_std, 32);            % #32 layer output
           
           flatten_features = features(:)';                     % flatten
           res_features = [res_features;flatten_features];
           res_labels = [res_labels; labels(f)];                        % covid as 1
        end
    end
    save('res_features');
    save('res_labels');
end
