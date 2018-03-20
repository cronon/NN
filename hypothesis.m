function p = hypothesis(inner_t, outer_t, r, Theta)
    p = Theta*[1; inner_t; outer_t; r; inner_t^2; outer_t^2; inner_t*outer_t];
end