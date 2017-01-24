function [movement_vector]=block_matching(previous_image,current_image,block_size,area_size)
    image_size=size(current_image);
    movement_vector=double(zeros(image_size(1),image_size(2),3));
    for count_i=1:block_size/2:image_size(1)-block_size/2
        for count_j=1:block_size/2:image_size(2)-block_size/2
            vector_pos=get_max_corr_pos(count_i,count_j,previous_image,current_image,block_size,area_size);
            movement_vector(count_i,count_j,:)=[count_i-vector_pos(1) count_j-vector_pos(2) 1];
        end
    end
end