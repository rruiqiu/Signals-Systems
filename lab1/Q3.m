clear
img = imread('ee3tp3picture2022.jpg');

red= 5.* img(:,:,1);
green= 5. * img(:,:,2);
%don't need to change
blue=img(:,:,3);

%reconstruct the image
reconstructed_image=cat(3,red,green,blue);
imshow(reconstructed_image);

%writing files
imwrite(reconstructed_image, 'my_fixed_image.jpg');