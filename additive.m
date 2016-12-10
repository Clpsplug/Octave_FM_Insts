function y=additive(origin, add, offset)
    y=origin;
    disp(size(origin))
    if size(origin, 2) + offset < size(add, 2)
        error('[OOPS] IndexOutOfRangeException thrown from additive: Array to add is too long, or Array is too off-set to fit in origin');
    end
    if offset < 0
       error('[OOPS] InvalidArgumentException thrown from additive: Negative offset'); 
    end
    disp(origin(offset+1:offset+i+1) + add(1:i));
    disp(origin(offset+1:offset+i+1));
    disp(add(1:i));

    y(offset+1:offset+i+1) = origin(offset+1:offset+i+1) + add(1:i);
end
