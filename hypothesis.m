function p = hypothesis(inner_t, outer_t, r, Theta)
    p = Theta*[1 inner_t outer_t r]';
end
