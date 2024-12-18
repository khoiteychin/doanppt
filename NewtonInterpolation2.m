function result = NewtonInterpolation2(xa, ya, x)
    n = length(xa);
    % Bước 1: Tạo bảng sai phân chia
    dividedDiff = zeros(n, n); 
    dividedDiff(:, 1) = ya'; % Cột đầu tiên là giá trị ya

    % Tính các sai phân chia
    for j = 2:n
        for i = 1:n-j+1
            dividedDiff(i, j) = (dividedDiff(i+1, j-1) - dividedDiff(i, j-1)) / (xa(i+j-1) - xa(i));
        end
    end

    % Bước 2: Tính giá trị nội suy bằng công thức Newton
    result = dividedDiff(1, 1); % Hệ số đầu tiên
    product = 1; % Biến lưu tích (x - xa(i))
    for i = 1:n-1
        product = product .* (x - xa(i)); % Cập nhật tích
        result = result + product * dividedDiff(1, i+1); % Cộng thêm hệ số Newton
    end
end
