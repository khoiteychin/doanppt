function result = LagrangeInterpolation2(xa, ya, x)
    n = length(xa);
    result = 0;

    % Tính các đa thức cơ sở Lagrange
    for i = 1:n
        L = 1; % Lưu trữ giá trị của đa thức cơ sở
        for j = 1:n
            if i ~= j
                L = L .* (x - xa(j)) / (xa(i) - xa(j)); % Cập nhật đa thức cơ sở
            end
        end
        result = result + L * ya(i); % Cộng giá trị nội suy
    end
end
